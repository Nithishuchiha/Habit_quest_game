@echo off
REM Habit Quest - GitHub Pages Deployment Script (Batch)
REM This script deploys the game to https://Nithishuchiha.github.io/Habit_quest_game/

echo === Habit Quest GitHub Pages Deployer ===
echo.

REM Switch to gh-pages branch
echo Switching to gh-pages branch...
git checkout --orphan gh-pages 2>nul
git rm -rf . 2>nul

REM Copy the game file as index.html
echo Copying habit_quest_2026.html as index.html...
copy /Y "habit_quest_2026.html" "index.html"

REM Stage and commit
git add index.html
git commit -m "Deploy Habit Quest to GitHub Pages"

REM Push gh-pages branch
echo Pushing to origin/gh-pages...
git push origin gh-pages

REM Switch back to main
git checkout main

echo.
echo === Deployment Complete! ===
echo Your game is live at: https://Nithishuchiha.github.io/Habit_quest_game/
echo.
echo Make sure GitHub Pages is enabled:
echo   1. Go to https://github.com/Nithishuchiha/Habit_quest_game/settings/pages
echo   2. Source: Deploy from a branch
echo   3. Branch: gh-pages / root
echo   4. Click Save
pause
