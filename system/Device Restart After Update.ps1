
# Restart as soon as possible to finish updating
Function EnableDeviceRestartAfterUpdate {
	Write-Output "Enabling Device Restart After Update ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name IsExpedited -PropertyType DWord -Value 1 -Force
}

# Don't restart as soon as possible to finish updating
Function DisableDeviceRestartAfterUpdate {
	Write-Output "Disabling Device Restart After Update ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name IsExpedited -PropertyType DWord -Value 0 -Force
}