# Hide the "New App Installed" indicator
Function HideNewAppInstalledNotification {
	Write-Output "Hiding New App Installed Notification ..."
	if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer))
	{
		New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
	}
	New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoNewAppAlert -PropertyType DWord -Value 1 -Force
}

# Show the "New App Installed" indicator
Function ShowNewAppInstalledNotification {
	Write-Output "Showing New App Installed Notification ..."
	Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoNewAppAlert -Force
}