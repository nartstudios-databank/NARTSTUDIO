@echo off
:: init_lfs.bat - Setup Git LFS, verify .gitattributes, and create a new chapter folder tree
:: Usage: init_lfs.bat <chapter_code> [ip-prefix]
::   chapter_code: CH001, CH002, etc.
::   ip-prefix: NCU or OBT (default: NCU)

if [%1] == [] (
    echo Usage: init_lfs.bat <chapter_code> [ip-prefix]
    echo Example: init_lfs.bat CH001 NCU
    exit /b 1
)

set CHAPTER=%1
set IP_PREFIX=%2
if [%IP_PREFIX]==[] set IP_PREFIX=NCU

echo ==========================================
echo Nartstudio Git LFS Setup & Chapter Init
echo ==========================================

echo.
echo [1] Installing Git LFS...
git lfs install
if errorlevel 1 (
    echo ! Failed to install Git LFS. Please install from https://git-lfs.github.com/
    exit /b 1
)
echo ! Git LFS installed successfully.

echo.
echo [2] Verifying .gitattributes...
if not exist .gitattributes (
    echo ! WARNING: .gitattributes not found in repo root!
    echo! Creating minimal .gitattributes...
    echo *
    echo .
) else (
    echo ! .gitattributes found.
)

echo.
echo [3] Creating chapter folder tree for %CHAPTER%...

:: Stage codes in pipeline order
set STAGES=SC ST LA LI FL RE LF QA

mkdir "%CHAPTER%" 2>nul
if errorlevel 1 (
    echo ! Failed to create chapter folder
    exit /b 1
)

for %S in (%STAGES%) do (
    mkdir "%CHAPTER%\%S" 2>nul
    if errorlevel 1 (
        echo ! Failed to create %S folder
        exit /b 1
    )
    echo Creating %CHAPTER%\%S...
    echo.>"%CHAPTER%\%S\.gitkeep"
)

:: Create FINAL split folders
mkdir "%CHAPTER%\08_QA\PRINT_CMYK" 2>nul
mkdir "%CHAPTER%\08_QA\WEBTOON_RGB" 2>nul
mkdir "%CHAPTER%\08_QA\DELIVERY" 2>nul

echo.
echo ==========================================
echo Chapter %CHAPTER% structure ready for %IP_PREFIX!
echo ==========================================
echo.
echo Folder layout:
echo %CHAPTER%\01_SCRIPT/       - Script handoff
echo %CHAPTER%\02_STORYBOARD/   - Storyboard artist
echo %CHAPTER%\03_LAYOUT/       - Layout + 3D + balloons
echo %CHAPTER%\04_LINES_FG/     - Line art (corrected from LINKS_FG)
echo %CHAPTER%\05_FLATS/        - Flats
echo %CHAPTER%\06_RENDER/       - Render and FX
echo %CHAPTER%\07_FINAL/        - Final lettering
echo %CHAPTER%\08_QA\PRINT_CMYK/ - Print CMYK version
echo %CHAPTER%\08_QA\WEBTOON_RGB/ - Webtoon RGB version
echo %CHAPTER%\08_QA\DELIVERY/   - Delivery handoff
echo.
echo !
echo Next steps:
echo 1. Add your file following NAMING_CONVENTION.md
echo 2. git add . && git commit -m "TRELLO_ID: %CHAPTER% init"
echo 3. git push origin main
echo.
echo ! Remember: Lockable files (.clip, .psd, .blend) require
echo ! `git lfs lock <filename>` before editing.