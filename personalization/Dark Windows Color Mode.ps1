# Set the default Windows mode to dark
Function DarkWindowsColorMode {
	Write-Output "Setting Dark Windows Color Mode ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -PropertyType DWord -Value 0 -Force
}

# Set the default Windows mode to light
Function LightWindowsColorMode {
	Write-Output "Setting Light Windows Color Mode ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -PropertyType DWord -Value 1 -Force
}