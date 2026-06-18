@echo off
REM Habit Quest - GitHub Pages Deploy Script (Batch)
REM This script deploys the game to https://Nithishuchiha.github.io/Habit_quest_game/

echo === Habit Quest GitHub Pages Deployer ===
echo.

REM Copy the game file as index.html
echo Copying habit_quest_2026.html as index.html...
copy /Y "habit_quest_2026.html" "index.html"

REM Commit and push
git add index.html
git commit -m "Deploy Habit Quest to GitHub Pages"
git push origin main

echo.
echo === Deployment Complete! ===
echo Your game is live at: https://Nithishuchiha.github.io/Habit_quest_game/
echo.
echo IMPORTANT: Enable GitHub Pages in your repo settings:
echo   1. Go to https://github.com/Nithishuchiha/Habit_quest_game/settings/pages
echo   2. Source: Deploy from a branch
echo   3. Branch: main  ^|  Folder: / (root)
echo   4. Click Save
pause
