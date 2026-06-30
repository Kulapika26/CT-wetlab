@echo off
cd /d "%~dp0"
echo Uploading to GitHub...
echo.
git add -A
git commit -m "update: add new articles"
git push origin main
echo.
if %errorlevel%==0 (
    echo SUCCESS - Wait 1-2 min for Netlify to redeploy.
) else (
    echo DONE - Check messages above.
)
echo.
pause
