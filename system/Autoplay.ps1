# Don't use AutoPlay for all media and devices
Function DisableAutoplay {
	Write-Output "Disabling Autoplay ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers -Name DisableAutoplay -PropertyType DWord -Value 1 -Force
}

# Use AutoPlay for all media and devices
Function EnableAutoplay {
	Write-Output "Enabling Autoplay ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers -Name DisableAutoplay -PropertyType DWord -Value 0 -Force
}
