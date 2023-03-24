
# Enable Num Lock at startup
Function EnableNumLock {
	Write-Output "Enabling NumLock at startup ..."
	New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -PropertyType String -Value 2147483650 -Force
}

# Disable Num Lock at startup
Function DisableNumLock {
	Write-Output "Disabling NumLock at startup ..."
	New-ItemProperty -Path "Registry::HKEY_USERS\.DEFAULT\Control Panel\Keyboard" -Name InitialKeyboardIndicators -PropertyType String -Value 2147483648 -Force
}