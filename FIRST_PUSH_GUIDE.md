# First Push to GitHub — Guide for Artists

This guide walks you through pushing your first file to the Nartstudio repo using GitHub Desktop and Git LFS.

## Step 1: Create the Repository (once, by the repo owner)

1. Go to github.com and click **New Repository**
2. Name it (e.g., `nartstudio-comics`)
3. **Initialize with a README** (we'll replace this)
4. Click **Create repository**

## Step 2: Install Git LFS

1. In GitHub Desktop, go to **Tools** → **Install Git LFS**
2. A command prompt will open — watch for "Git LFS installed" message
3. If it fails, install Git LFS manually from https://git-lfs.github.com/

## Step 3: Clone the Repo

1. In GitHub Desktop, click **File** → **Clone repository**
2. Select your repo and click **Clone**
3. Choose a local folder (this is where your art files will live)

## Step 4: Run the Init Script (creates folder tree)

**Windows:** double-click `init_lfs.bat CH001 NCU`
**Mac/Linux:** open terminal, run `bash init_lfs.sh CH001 NCU`

What this does:
- Installs Git LFS (if not already installed)
- Verifies `.gitattributes` exists
- Creates the folder tree: `CH001/01_SCRIPT/`, `CH001/02_STORYBOARD/`, ..., `CH001/08_QA/PRINT_CMYK/`, `CH001/08_QA/WEBTOON_RGB/`
- Each folder gets a `.gitkeep` file so empty folders persist

## Step 5: Add Your File

1. Save your file using the naming convention:
   `IP_CH###_STAGE_v##.ext`
   - Example: `NCU_CH001_v01.LI.clip` (Line Art, Chapter 1, Version 1, Clip Studio)
   - Example: `OBT_Shot02_v01.ST.blend` (Storyboard, Shot 2, Blender)

2. Place the file in the correct stage folder:
   - Stage 04 → `CH001/04_LINES_FG/`

## Step 6: Commit and Push (via GitHub Desktop)

1. In GitHub Desktop, go to **File** → **Commit to main**
2. **Write the commit message** using this exact format:
   ```
   TRELLO_CARD_ID: COMIC-042
   STAGE: LI
   PAGE: v01
   FILE: hero_intro_clip01
   ```
   - `TRELLO_CARD_ID`: Your Trello card number (e.g., `COMIC-042`)
   - `STAGE`: 2-letter code (SC, ST, LA, LI, FL, RE, LF, QA)
   - `PAGE`: Page number with `v` prefix (or `v01` for single-page)
   - `FILE`: Brief description, no spaces, underscores allowed

3. Click **Commit to main**

4. Click **Push origin** (top-right corner)

## Step 5: Verify on github.com

1. Open your repo on github.com
2. Look at your file — it should show a **grey LFS pointer icon**, not the full file thumbnail
3. If you see the actual file (large thumbnail), it's NOT LFS-tracked — ask for help
4. Check that the Trello Power-Up may have moved your card based on the commit message

## Need Help?

- Ask in the Nartstudio Notion or WhatsApp group
- Run `git lfs lock filename.clip` / `git lfs unlock filename.clip` (trained personnel only)
- Check `NAMING_CONVENTION.md` for full naming rules