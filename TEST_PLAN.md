# Week 1 Test Plan

Run these tests during the first week to verify the repository structure works correctly.

## Test 1: Commit a Dummy .clip File

1. Save a dummy file: `NCU_CH001_v01.LI.clip` in `01_SCRIPT/` or `04_LINES_FG/`
2. In GitHub Desktop: **Commit to main** with message:
   ```
   TRELLO_CARD_ID: COMIC-001
   STAGE: LI
   PAGE: v01
   FILE: test_clip_intro
   ```
3. **Push origin**
4. **Verify on github.com**: File shows grey LFS pointer icon
5. **Expected**: ✓ File pushes successfully with LFS pointer

## Test 2: Commit a Dummy .blend File

1. Save a dummy file: `OBT_Shot01_v01.ST.blend` in `03_LAYOUT/`
2. Commit and push as above
3. **Verify on github.com**: File shows grey LFS pointer icon
4. **Expected**: ✓ .blend file is LFS-tracked

## Test 3: Test a Lock

> ⚠ Only trained personnel should perform this test.

1. Run: `git lfs lock NCU_CH001_v01.LI.clip`
2. **Expected**: Command succeeds; the file is now locked exclusively
3. Try to commit changes to the same file via GitHub Desktop
4. **Expected**: Commit may fail or warn that the file is locked
5. Run: `git lfs unlock NCU_CH001_v01.LI.clip` to release the lock
6. **Expected**: Lock is released, edits can continue

## Test 4: Break the Naming Rule on Purpose — Confirm Validator Catches It

1. Try to commit a file with an invalid name, e.g.: `CH001_v01.LI.clip` (missing IP prefix)
2. Run the name validator: `python name_validator.py CH001_v01.LI.clip`
3. **Expected**: ✗ Validator reports: `"CH001_v01.LI.clip" - doesn't match IP_CH###_STAGE_v##.ext`
4. Do NOT push this file — it will fail the GitHub Actions check

## Test 5: Confirm Trello Card Moves (or Manual Fallback Works)

1. Commit a file with the Trello card ID in the message:
   `TRELLO_CARD_ID: COMIC-005`
2. Push the commit
3. **Check Trello**: The Power-Up may auto-move the card based on commit text
4. **Fallback**: If the Power-Up doesn't move it, the commit message contains `COMIC-005` which can be used with manual card-move rules
5. **Expected**: ✓ Card either auto-moves or the ID is visible for manual use

## Test 6: Storage Report Wednesday Check

1. Run: `bash storage_report.sh`
2. **Expected**: Output shows total LFS size in MB, per-folder breakdown
3. Threshold default is 500 MB; verify the warning message appears if over threshold
4. **Expected**: ✓ Report generates and indicates if quota is approaching limits

---

**All tests pass** → The repo structure is working. Artists can commit LFS-tracked files, the naming validator catches errors, locks work, and Trello integration functions.