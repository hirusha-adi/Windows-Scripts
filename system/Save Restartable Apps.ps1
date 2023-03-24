# Automatically saving my restartable apps and restart them when I sign back in
Function EnableSaveRestartableApps {
	Write-Output "Enabling Save Restartable Apps ..."
	New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name RestartApps -Value 1 -Force
}

# Turn off automatically saving my restartable apps and restart them when I sign back in
Function DisableSaveRestartableApps {
	Write-Output "Disabling Save Restartable Apps ..."
	New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name RestartApps -Value 0 -Force
}