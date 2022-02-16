pwsh -c "Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force"
pwsh -c "Install-Module Az -AllowClobber -Force"
pwsh -c "Update-Module -Name Az -Force"
