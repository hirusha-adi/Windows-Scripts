# Do not let websites show me locally relevant content by accessing my language list
Function DisableLanguageListAccess {
	Write-Output "Disabling Language List Access ..."
	New-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -PropertyType DWord -Value 1 -Force
}

# Let websites show me locally relevant content by accessing language my list
Function EnableLanguageListAccess {
	Write-Output "Enabling Language List Access ..."
	Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -Force -ErrorAction Ignore
}
