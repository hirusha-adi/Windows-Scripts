# Disable first sign-in animation after the upgrade
Function DisableFirstLogonAnimation {
	Write-Output "Disabling First Logon Animation ..."
	New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name EnableFirstLogonAnimation -PropertyType DWord -Value 0 -Force
}

# Enable first sign-in animation after the upgrade
Function EnableFirstLogonAnimation {
	Write-Output "Enabling First Logon Animation ..."
	New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name EnableFirstLogonAnimation -PropertyType DWord -Value 1 -Force
}