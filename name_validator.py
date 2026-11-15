#!/usr/bin/env python3
"""name_validator.py - Check file names against the studio convention."""
import re
import sys
import os
import subprocess

STAGE_CODES = {"SC", "ST", "LA", "LI", "FL", "RE", "LF", "QA"}
FILE_PATTERN = re.compile(
    r'^([A-Z]{2,4})_CH(\d{3})(?:_PG(\d{3}))?_(' + '|'.join(STAGE_CODES) + r')_v(\d{2})\.([a-z]+)$'
)


def validate_filename(filename):
    """Return (is_valid, reason) tuple."""
    basename = os.path.basename(filename)
    match = FILE_PATTERN.match(basename)
    if not match:
        return False, f"'{basename}' doesn't match IP_CH###_STAGE_v##.ext"
    ip, chapter, page, stage, version, ext = match.groups()
    v_num = int(version)
    if v_num < 1:
        return False, f"Version v{version} must start at v01"
    return True, "Valid"


def main():
    if len(sys.argv) < 2:
        print("Usage: python name_validator.py <filename>")
        sys.exit(1)

    filename = sys.argv[1]
    valid, reason = validate_filename(filename)
    if valid:
        print(f"✓ {filename} - valid")
    else:
        print(f"✗ {filename} - {reason}")
        sys.exit(1)


if __name__ == "__main__":
    main()