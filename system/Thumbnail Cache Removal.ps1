# Disable thumbnail cache removal
Function DisableThumbnailCacheRemoval {
	Write-Output "Disabling Thumbnail Cache Removal ..."
	New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" -Name Autorun -PropertyType DWord -Value 0 -Force
}

# Enable thumbnail cache removal
Function EnableThumbnailCacheRemoval {
	Write-Output "Enabling Thumbnail Cache Removal ..."
	New-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" -Name Autorun -PropertyType DWord -Value 3 -Force
}