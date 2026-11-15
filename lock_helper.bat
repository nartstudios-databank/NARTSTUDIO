@echo off
:: lock_helper.bat - Git LFS lock/unlock/locks helper
:: Usage:
::   lock_helper.bat lock <filename>     - Lock a file for exclusive editing
::   lock_helper.bat unlock <filename>   - Unlock a file
::   lock_helper.bat locks               - List current locks
::   lock_helper.bat cheat-sheet         - Print cheat-sheet

if "%1"=="lock" (
    if "%2"==="" (
        echo Error: filename required.
        echo Usage: lock_helper.bat lock <filename>
    ) else (
        echo Running: git lfs lock %2
        git lfs lock %2
    )
) else if "%1"=="unlock" (
    if "%2"==="" (
        echo Error: filename required.
        echo Usage: lock_helper.bat unlock <filename>
    ) else (
        echo Running: git lfs unlock %2
        git lfs unlock %2
    )
) else if "%1"=="locks" (
    echo Git LFS lock list:
    git lfs locks
) else if "%1"=="cheat-sheet" (
    echo.
    echo Git LFS lock cheat-sheet:
    echo.
    echo 1. Before editing a lockable file (.clip, .psd, .blend):
    echo    git lfs lock filename.ext
    echo .
    echo 2. After editing, save the file, then:
    echo    git lfs unlock filename.ext
    echo .
    echo 3. To check who has the file locked:
    echo    git lfs locks
    echo .
    echo 4. Important: Only trained personnel should run lock/unlock!
    echo    GitHub Desktop has no lock button - use the command line.
    echo .
    echo 5. Never overwrite a locked file without unlocking first.
    echo.
) else (
    echo Unknown command: %1
    echo Usage: lock_helper.bat [lock|unlock|locks|cheat-sheet]
)