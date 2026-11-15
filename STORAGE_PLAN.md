# Storage and Growth Plan

## Commit vs. Keep Out of Repo

| File Type | In Repo? | Reason |
|-----------|----------|--------|
| **LFS-tracked art** (.clip, .psd, .blend, .tif, .exr, .pdf, .mp4) | ✓ Yes | Git LFS handles storage; version history needed |
| **Naming-convention files** | ✓ Yes | Machine-checked; essential for pipeline |
| **Temp/cache files** (.blend1, .DS_Store, Thumbs.db) | ✗ No | In `.gitignore` |
| **Working exports / renders in progress** | ✗ No | Keep on local drive/Notion until final |
| **Raw source exports** (unprocessed .png, .tif) | ✗ No | Use pipeline stages instead |
| **Notion SOPs / task lists** | ✗ No | Notion is source of truth |
| **Trello data** | ✗ No | Trello is work tracker |

## When to Archive a Finished Chapter

1. **All 8 pipeline stages complete** — every stage folder has a `v##` file
2. **Both FINAL outputs exist** — `PRINT_CMYK` and `WEBTOON_RGB` versions present
3. **Creative Director sign-off** — QA PR approved and merged
4. **LFS cleanup** — remove large object history if possible; tag the commit for reference

### Archive process:
- Move the chapter folder from `_NCU/01_SCRIPT/` or `_OUBYT/_SHOTS/` to `_ARCHIVE/`
- Tag the final merged commit with `v##-CH###` for reference
- Keep the folder readable but marked `archive`; do not delete LFS objects (they're stored remotely)

## LFS Quota Upgrade Path

- **Free tier**: ~1 GB storage + 1 GB bandwidth per month (GitHub's free plan)
- **Weekly check** (Wednesday): `storage_report.sh` reports total LFS size
- **When threshold is approached** (e.g., >800 MB):
  1. Archive finished chapters to `_ARCHIVE/`
  2. Consider GitHub LFS paid plan or external storage (Perforce, Dropbox Business)
  3. Re-review: are all old versions needed, or can v01-v03 be pruned?
- **Upgrade path**: GitHub LFS Cloud > $5/mo for 5 GB, or integrate with studio's existing Natoplus Enterprise storage

## Growth Prevention Rules

1. **Never keep two versions of the same stage** — always overwrite with newer `v##` (but keep the file, don't delete; Git LFS handles history)
2. **Delete temp files before committing** — the `.gitignore` handles this, but verify with `git status`
3. **One file per commit** — if you must edit a lockable file, unlock, edit, lock, commit; don't bundle multiple changes
4. **LINES_FG is the line-art folder** — do not create `LINKS_FG` (typo correction is permanent)