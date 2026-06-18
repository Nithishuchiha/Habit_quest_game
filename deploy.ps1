# Habit Quest - GitHub Pages Deploy Script
# This script deploys the game to https://Nithishuchiha.github.io/Habit_quest_game/

$ErrorActionPreference = "Stop"

$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "=== Habit Quest GitHub Pages Deployer ===" -ForegroundColor Cyan
Write-Host ""

Set-Location $repoDir

# Copy the game file as index.html
Write-Host "Copying habit_quest_2026.html as index.html..." -ForegroundColor Green
Copy-Item "habit_quest_2026.html" -Destination "index.html" -Force

# Commit
git add index.html
git commit -m "Deploy Habit Quest to GitHub Pages"

# Push to main
Write-Host "Pushing to origin/main..." -ForegroundColor Green
git push origin main

Write-Host ""
Write-Host "=== Deployment Complete! ===" -ForegroundColor Cyan
Write-Host "Your game is live at: https://Nithishuchiha.github.io/Habit_quest_game/" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Enable GitHub Pages in your repo settings:" -ForegroundColor Yellow
Write-Host "  1. Go to https://github.com/Nithishuchiha/Habit_quest_game/settings/pages" -ForegroundColor White
Write-Host "  2. Source: Deploy from a branch" -ForegroundColor White
Write-Host "  3. Branch: main  |  Folder: / (root)" -ForegroundColor White
Write-Host "  4. Click Save" -ForegroundColor White
