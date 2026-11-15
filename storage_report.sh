#!/usr/bin/env bash
# storage_report.sh - Lists LFS object count and size per folder for Wednesday check
# Usage: ./storage_report.sh [warning_threshold_mb]
#   Default warning threshold: 500 MB

set -e

THRESHOLD=${1:-500}  # Default 500 MB

echo "=== Nartstudio LFS Storage Report ==="
echo "Warning threshold: ${THRESHOLD} MB"
echo "Generated: $(date)"
echo ""

# Get LFS object count and size per directory
echo "LFS objects by directory:"
echo "------------------------"

# Use git lfs ls-files to get per-directory info
git lfs ls-files 2>/dev/null | while read -r oid size name; do
    # Extract directory from name
    dir="$(dirname "$name")"
    if [ -z "$dir" ] || [ "$dir" = "." ]; then
        dir="root"
    fi
    # Accumulate size per directory
    declare -A dir_size 2>/dev/null || true
    # Simple approach: just list and let awk handle it later
    echo "${size} ${dir}"
done | awk '
BEGIN { FS=" " }
{
    dir = $2
    size = $1
    # Convert size (bytes) to MB
    mb = size / (1024 * 1024)
    total[dir] += mb
}
END {
    for (d in total) {
        printf "%-20s %.2f MB\n", d, total[d]
    }
}'
echo ""

# Total LFS size
TOTAL_BYTES=$(git lfs ls-files 2>/dev/null | awk '{sum += $1} END {print sum+0}')
TOTAL_MB=$((TOTAL_BYTES / (1024 * 1024)))
echo "Total LFS size: ${TOTAL_MB} MB"
echo "Warning threshold: ${THRESHOLD} MB"

if [ "${TOTAL_MB}" -gt "${THRESHOLD}" ]; then
    echo "⚠ WARNING: LFS storage exceeds threshold!"
else
    echo "✓ LFS storage within threshold."
fi

echo ""
echo "Folder-by-folder breakdown (for Wednesday check):"
echo "Run 'git lfs ls-files' for detailed per-file sizes."