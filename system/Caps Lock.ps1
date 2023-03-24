# Disable Caps Lock
Function DisableCapsLock {
	Write-Output "Disabling Caps Lock ..."
	New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -Name "Scancode Map" -PropertyType Binary -Value ([byte[]](0,0,0,0,0,0,0,0,2,0,0,0,0,0,58,0,0,0,0,0)) -Force
}

# Enable Caps Lock
Function EnableCapsLock {
	Write-Output "Enabling Caps Lock ..."
	Remove-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -Name "Scancode Map" -Force -ErrorAction Ignore
}