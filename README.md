# Nartstudio Git Repository

**This repo stores heavy art/3D files and version history ONLY via Git LFS.**

## One rule per tool

| Tool | Purpose | What NOT to put here |
|------|---------|----------------------|
| **Notion** | Knowledge: Story Bible, Style Package, SOPs, results | SOPs, task lists, documentation |
| **Trello** | Work: cards, stages, assignees, deadlines | Git commit messages are the fallback for card moves |
| **GitHub + Git LFS** | Heavy art/3D files and version history | Anything beyond LFS-tracked art files |
| **WhatsApp** | Talk | Technical discussions |

## How to commit a stage

1. **Save your file** using the strict naming convention:
   `IP_CH###_PG###_STAGE_v##.ext`
   - Example: `NCU_CH001_v01.LI.clip` (Line Art, Chapter 1, Version 1)
   - See `NAMING_CONVENTION.md` for full rules

2. **Open GitHub Desktop** → **File** → **Commit to main**

3. **Write the commit message** using the template:
   ```
   TRELLO_CARD_ID: NCU_CH001
   STAGE: LI
   PAGE: v01
   FILE: hero_intro_clip01
   ```
   - `TRELLO_CARD_ID`: The Trello card number (e.g., `COMIC-45`)
   - `STAGE`: 2-letter stage code (SC, ST, LA, LI, FL, RE, LF, QA)
   - `PAGE`: Page number if applicable, otherwise `v01`
   - `FILE`: Brief description (no spaces)

4. **Click "Commit"** → **"Push origin"**

5. **Verify on github.com** that the file shows a grey LFS pointer icon, not the full file.

## Folder hierarchy per chapter

Each chapter gets its own folder: `NCU_CH001/` or `OBT_CH001/`

- `01_SCRIPT/` through `08_QA/` — numbered pipeline stages
- `08_QA/PRINT_CMYK/` and `08_QA/WEBTOON_RGB/` — final output splits
- `LINES_FG/` — line art folder (note: corrected from `LINKS_FG`)

## Important

- **Never overwrite a previous stage** — always push as a new file with incremented version (`v01`, `v02`, etc.)
- **Lockable files** (`*.clip`, `*.psd`, `*.blend`) require `git lfs lock` before editing. GitHub Desktop has no lock button — a trained person runs the command.
- **Wednesday storage check** — LFS object count and size are reviewed weekly. Keep bloat low by archiving finished chapters.
- **Do not duplicate** Notion content or Trello tasks in this repo. Use the pointers above.

## Need help?

- `NAMING_CONVENTION.md` — full naming rules and examples
- `.gitattributes` — Git LFS tracking configuration
- `.gitignore` — excluded temp/cache files
- Ask in the Nartstudio Notion or WhatsApp group