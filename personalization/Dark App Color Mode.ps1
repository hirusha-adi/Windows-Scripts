# Set the default app mode to dark
Function DarkAppColorMode {
	Write-Output "Setting Dark App Color Mode ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -PropertyType DWord -Value 0 -Force
}

# Set the default app mode to light
Function LightAppColorMode {
	Write-Output "Setting Light App Color Mode ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -PropertyType DWord -Value 1 -Force
}