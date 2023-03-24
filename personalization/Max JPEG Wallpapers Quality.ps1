# Set the quality factor of the JPEG desktop wallpapers to maximum
Function MaxJPEGWallpapersQuality {
	Write-Output "Setting Max JPEG Wallpapers Quality ..."
	New-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name JPEGImportQuality -PropertyType DWord -Value 100 -Force
}

# Set the quality factor of the JPEG desktop wallpapers to default
Function DefaultJPEGWallpapersQuality {
	Write-Output "Setting Default JPEG Wallpapers Quality ..."
	Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name JPEGImportQuality -Force -ErrorAction Ignore
}