param(
    [string]$msg
)

if (-not $msg) {
    Write-Host "❌ Please provide a commit message."
    Write-Host "👉 Usage: .\gitpush.ps1 'your commit message'"
    exit 1
}

git add .
git commit -m "$msg"
git push origin main
