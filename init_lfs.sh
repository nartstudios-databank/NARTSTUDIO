#!/usr/bin/env bash
# init_lfs.sh - Setup Git LFS and create chapter folder tree
# Usage: ./init_lfs.sh CH001 [NCU|OBT]
# Dependency: Git LFS must be installed

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <chapter_code> [ip-prefix]"
    echo "Example: $0 CH001 NCU"
    exit 1
fi

CHAPTER="$1"
IP_PREFIX="${2:-NCU}"

echo "=== Nartstudio Git LFS Setup & Chapter Init ==="

# Step 1: Git LFS install
echo "[1] Installing Git LFS..."
git lfs install
echo "✓ Git LFS installed"

# Step 2: Verify .gitattributes
echo ""
echo "[2] Verifying .gitattributes..."
if [ ! -f .gitattributes ]; then
    echo "⚠ .gitattributes not found - please ensure it's committed"
else
    echo "✓ .gitattributes found"
fi

# Step 3: Create folder structure
echo ""
echo "[3] Creating chapter ${CHAPTER} structure..."

STAGES="SC ST LA LI FL RE LF QA"

mkdir -p "${CHAPTER}"
for stage in $STAGES; do
    mkdir -p "${CHAPTER}/${stage}"
    touch "${CHAPTER}/${stage}/.gitkeep"
    echo "  Created ${CHAPTER}/${stage}/"
done

# Create FINAL split folders
mkdir -p "${CHAPTER}/08_QA/PRINT_CMYK"
mkdir -p "${CHAPTER}/08_QA/WEBTOON_RGB"
mkdir -p "${CHAPTER}/08_QA/DELIVERY"
echo "  Created ${CHAPTER}/08_QA/ directories"

echo ""
echo "=== Structure ready for ${IP_PREFIX} ${CHAPTER} ==="
echo ""
echo "Folder layout:"
echo "${CHAPTER}/01_SCRIPT/       - Script handoff"
echo "${CHAPTER}/02_STORYBOARD/   - Storyboard artist"
echo "${CHAPTER}/03_LAYOUT/       - Layout + 3D + balloons"
echo "${CHAPTER}/04_LINES_FG/     - Line art (corrected from LINKS_FG)"
echo "${CHAPTER}/05_FLATS/        - Flats"
echo "${CHAPTER}/06_RENDER/       - Render and FX"
echo "${CHAPTER}/07_FINAL/        - Final lettering"
echo "${CHAPTER}/08_QA/PRINT_CMYK/ - Print CMYK version"
echo "${CHAPTER}/08_QA/WEBTOON_RGB/ - Webtoon RGB version"
echo "${CHAPTER}/08_QA/DELIVERY/   - Delivery handoff"
echo ""
echo "Next steps:"
echo "1. Add your file following NAMING_CONVENTION.md"
echo "2. git add . && git commit -m \"TRELLO_ID: ${CHAPTER} init\""
echo "3. git push origin main"
echo ""
echo "Remember: Lockable files (.clip, .psd, .blend) require"
echo "git lfs lock <filename> before editing."