@echo off
cd /d "%~dp0"
echo ==================================================
echo   FORCE UPLOAD - overwrite GitHub with THIS folder
echo   (Anything on GitHub that differs will be replaced)
echo ==================================================
echo.
set /p ok=Type Y then Enter to continue:
if /i not "%ok%"=="Y" goto cancel
echo.
echo Uploading to GitHub...
echo.
git add -A
git commit -m "force update: overwrite remote with local"
git push --force origin main
echo.
if %errorlevel%==0 (
    echo SUCCESS - Remote replaced. Wait 1-2 min for Netlify.
) else (
    echo DONE - Check the messages above.
)
echo.
pause
exit /b

:cancel
echo Cancelled.
echo.
pause
