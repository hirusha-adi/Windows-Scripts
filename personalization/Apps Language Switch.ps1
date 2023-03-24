
# Do not use a different input method for each app window
Function DisableAppsLanguageSwitch {
	Write-Output "Disabling Apps Language Switch ..."
	Set-WinLanguageBarOption
}

# Let me use a different input method for each app window
Function EnableAppsLanguageSwitch {
	Write-Output "Enabling Apps Language Switch ..."
	Set-WinLanguageBarOption -UseLegacySwitchMode
}