# Turn off automatic installing suggested apps
Function DisableAppsSilentInstalling {
	Write-Output "Disabling Apps Silent Installing ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SilentInstalledAppsEnabled -PropertyType DWord -Value 0 -Force		
}

# Turn on automatic installing suggested apps
Function EnableAppsSilentInstalling {
	Write-Output "Enabling Apps Silent Installing ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SilentInstalledAppsEnabled -PropertyType DWord -Value 1 -Force		
}