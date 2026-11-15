# Contributing to Nartstudio — A Guide for Artists

## Using GitHub Desktop

1. **Clone the repo** — accept the GitHub Desktop prompt. Git LFS will install automatically on first push.

2. **Create your file** inside the correct chapter folder, following the naming convention:
   `IP_CH###_PG###_STAGE_v##.ext`
   - Example: `NCU_CH001_v01.LI.clip` means: Nartstudio Comic Universe, Chapter 1, Line Art, Version 1, Clip Studio file
   - See `NAMING_CONVENTION.md` for full rules

3. **Save the file** in your chapter folder (e.g., `NCU_CH001/04_LINES_FG/`)

4. **In GitHub Desktop:**
   - View the changed files
   - Enter a commit message using the template below
   - Click "Commit to main"
   - Click "Push origin"

## Commit message template

```
TRELLO_CARD_ID: COMIC-45
STAGE: LI
PAGE: v01
FILE: hero_intro_clip01
```

- `TRELLO_CARD_ID`: Your Trello card number (e.g., `COMIC-45`). The Trello Power-Up may move the card on commit; the text is also the guaranteed fallback.
- `STAGE`: 2-letter code — SC, ST, LA, LI, FL, RE, LF, or QA
- `PAGE`: Page number with `v` prefix, or `v01` for single-page
- `FILE`: Brief descriptive name, no spaces, use underscores

## After pushing

- Check on **github.com** that the file has a grey LFS pointer icon
- If the file is huge and not LFS-tracked, it will fail to push — ask for help
- If the commit message format is wrong, the Trello Power-Up may not move the card

## Lockable files (.clip, .psd, .blend)

These files require exclusive editing. Before editing:

1. Run `git lfs lock filename.clip` (or use the lock helper script)
2. Edit the file
3. After saving, run `git lfs unlock filename.clip`

**Only trained personnel should run lock/unlock commands.** GitHub Desktop has no lock button.

## What NOT to commit

- Temp/cache files (`.blend1`, `.DS_Store`, `Thumbs.db`) — they're in `.gitignore`
- Notion SOPs or task lists — those belong in Notion
- Large raw exports without LFS — they won't push

## Need help?

Ask in the Nartstudio Notion or WhatsApp group. The `.gitattributes` and `.gitignore` files are ready — just follow the steps above.