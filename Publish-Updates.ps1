[cmdletbinding()]
param (
    [string]$commitMessage
)

# Logic
Set-Alias -Name hugo -Value "C:\data\hugo\bin\hugo.exe"

# Remove Public Folder Contents
Get-ChildItem $PSScriptRoot\Public | Remove-Item -Force -Recurse

# Create new contents
hugo

# Publish Public Folder
Set-Location $PSScriptRoot\Public
git add .
git commit -m $commitMessage
git push origin master

# Commit changes to MAIN
Set-Location $PSScriptRoot
git add .
git commit -m $commitMessage
git push origin master