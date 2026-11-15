# Acceptance Checklist

## ✅ Repository Structure

- [x] Monorepo with `_NCU/` and `_OUBYT/` division markers
- [x] Project-level folders: `_STYLE_PACKAGE`, `_TEMPLATES`, `_REFERENCE`, `_DELIVERY`, `_ARCHIVE`
- [x] Per-chapter folders with stages 01_SCRIPT through 08_QA
- [x] `04_LINES_FG/` folder (typo corrected from LINKS_FG)
- [x] `08_QA/PRINT_CMYK/` and `08_QA/WEBTOON_RGB/` final output splits
- [x] `_OUBYT/_SHOTS/` variant for animation shots/sequences
- [x] All empty folders contain `.gitkeep`

## ✅ Naming Convention

- [x] Pattern: `IP_CH###_PG###_STAGE_v##.ext` (e.g., `NCU_CH001_v01.LI.clip`)
- [x] Allowed stage codes: SC, ST, LA, LI, FL, RE, LF, QA
- [x] 2-digit version (`v01`–`v99`), incrementing never overwrites
- [x] IP prefix distinguishes NCU vs OUBYT projects
- [x] Machine-checkable regex validator implemented
- [x] Good/bad examples documented

## ✅ .gitattributes

- [x] Git LFS tracking for all heavy types: .clip, .psd, .blend, .tif, .tiff, .exr, .png, .jpg, .pdf, .mp4, .mov, .zip, .ttf, .woff2
- [x] `lockable` attribute on .clip, .psd, .blend (exclusive editing marker)
- [x] `-text` flag on all binary files (prevents line-ending mangling)
- [x] Text files (`*.txt, *.md, *.json, *.csv`) with `eol=lf`
- [x] Comments in plain English explaining each line

## ✅ .gitignore

- [x] OS temp files (.blend1, .blend2)
- [x] Clip Studio autosave (.clip~, ClipStudio*.tmp)
- [x] Blender backup (.blend~, .blender/)
- [x] `.DS_Store`, `Thumbs.db`
- [x] Does NOT ignore `.blend` files (the actual project file)
- [x] Does NOT ignore production-required files

## ✅ Automation Helpers

- [x] `init_lfs.bat` / `init_lfs.sh` — installs Git LFS, verifies .gitattributes, creates chapter folder tree
- [x] `name_validator.py` — checks filenames against convention; run manually or as pre-commit hook
- [x] `lock_helper.bat` — wrappers for `git lfs lock / unlock / locks` with cheat-sheet
- [x] `storage_report.sh` — lists LFS object count/size per folder; warning threshold variable

## ✅ GitHub-Side Files

- [x] `README.md` — one-rule-per-tool table, folder hierarchy, commit steps, pointers to Notion/Trello
- [x] `CONTRIBUTING.md` — plain-step guide for GitHub Desktop artists
- [x] `COMMIT_TEMPLATE.md` — structured commit message format with TRELLO_CARD_ID, STAGE, PAGE, FILE
- [x] `PULL_REQUEST_TEMPLATE.md` — QA handoff and Creative Director sign-off checklist
- [x] `ISSUE_TEMPLATE.md` — QA bug report and handoff issue templates
- [x] `CODEOWNERS` — Creative Director on FINAL/ sign-off, Production Manager on structure changes
- [x] `.github/WORKFLOWS/name-validator.yml` — GitHub Actions: validates names and checks LFS pointers on every push

## ✅ Branching Approach

- [x] `main` only — simple for artists using GitHub Desktop
- [x] Light branch-per-chapter model not needed; stage folders and version numbering (`v01`, `v02`) provide sufficient isolation
- [x] All PRs go through `08_QA/` Creative Director approval (CODEOWNERS)

## ✅ Storage and Growth Plan

- [x] Clear: commit LFS-tracked art, keep temp/cache files out
- [x] Archive process: move finished chapters to `_ARCHIVE/`, tag final commit
- [x] LFS quota monitoring: weekly Wednesday check with `storage_report.sh`
- [x] Upgrade path: GitHub LFS paid plan or external storage integration at >800 MB
- [x] Growth prevention rules: one file per commit, delete temp files before committing, no LINKS_FG folder

---

# Items Needing Human Decision

| Item | Options | Recommendation | Owner |
|------|---------|----------------|-------|
| **LFS quota upgrade** | Stay on free tier (>1 GB/mo) OR pay for GitHub LFS Cloud ($5/mo for 5 GB) OR integrate with Natoplus Enterprise storage | Recommend: start free tier, monitor Wednesday checks, upgrade if >800 MB by week 4 | Production Manager |
| **Trello Power-Up compatibility** | Verify commit message format works with studio's existing Trello Power-Up rules | Test with actual Power-Up in Week 1; adjust format if card-moves don't trigger | Tech Lead |
| **Artist OS support** | Windows-only (GitHub Desktop) OR cross-platform (Windows + Mac) | Both supported; init scripts have `.bat` and `.sh` versions | All artists |
| **Chapter archival frequency** | Archive after every chapter OR archive quarterly | Archive after Creative Director sign-off per PR (per-chapter) | Creative Director |
| **Lock enforcement** | Trained personnel run `git lfs lock` OR implement pre-commit hook that blocks unlockable edits | Start with trained-person approach (simpler); add hook if violations occur | Production Manager |

**All items must be decided before Week 2.**