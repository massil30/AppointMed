@echo off
:: Check if a commit message was provided
if "%~1"=="" (
    echo ❌ Please provide a commit message.
    echo Example: gitpush "Fixed login bug"
    exit /b
)

echo 🧹 Adding all changes...
git add .

echo 📝 Committing with message: "%~1"
git commit -m "%~1"

echo 🚀 Pushing to origin main...
git push origin main

echo ✅ Done!
