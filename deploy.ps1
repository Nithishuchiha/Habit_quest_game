# Habit Quest - GitHub Pages Deployment Script
# This script deploys the game to https://Nithishuchiha.github.io/Habit_quest_game/

$ErrorActionPreference = "Stop"

$repoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$mainBranch = "main"
$ghPagesBranch = "gh-pages"

Write-Host "=== Habit Quest GitHub Pages Deployer ===" -ForegroundColor Cyan
Write-Host ""

# Ensure we're in the repo root
Set-Location $repoDir

# Check if gh-pages branch exists locally
$ghPagesExists = git branch --list $ghPagesBranch 2>$null

if (-not $ghPagesExists) {
    Write-Host "Creating orphan $ghPagesBranch branch..." -ForegroundColor Yellow
    git checkout --orphan $ghPagesBranch
    git rm -rf . 2>$null
} else {
    Write-Host "Switching to $ghPagesBranch branch..." -ForegroundColor Yellow
    git checkout $ghPagesBranch
    git rm -rf . 2>$null
}

# Copy the game file as index.html
Write-Host "Copying habit_quest_2026.html as index.html..." -ForegroundColor Green
Copy-Item "$repoDir\habit_quest_2026.html" -Destination "index.html"

# Stage and commit
git add index.html
git commit -m "Deploy Habit Quest to GitHub Pages"

# Push gh-pages branch
Write-Host "Pushing to origin/$ghPagesBranch..." -ForegroundColor Green
git push origin $ghPagesBranch

# Switch back to main
git checkout $mainBranch

Write-Host ""
Write-Host "=== Deployment Complete! ===" -ForegroundColor Cyan
Write-Host "Your game is live at: https://Nithishuchiha.github.io/Habit_quest_game/" -ForegroundColor Green
Write-Host ""
Write-Host "Make sure GitHub Pages is enabled:" -ForegroundColor Yellow
Write-Host "  1. Go to https://github.com/Nithishuchiha/Habit_quest_game/settings/pages" -ForegroundColor White
Write-Host "  2. Source: Deploy from a branch" -ForegroundColor White
Write-Host "  3. Branch: gh-pages / root" -ForegroundColor White
Write-Host "  4. Click Save" -ForegroundColor White
