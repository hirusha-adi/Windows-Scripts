# Launch folder windows in a separate process
Function EnableFoldersLaunchSeparateProcess {
	Write-Output "Enabling Folders Launch Separate Process ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SeparateProcess -PropertyType DWord -Value 1 -Force
}

# Do not launch folder windows in a separate process
Function DisableFoldersLaunchSeparateProcess {
	Write-Output "Disabling Folders Launch Separate Process ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SeparateProcess -PropertyType DWord -Value 0 -Force
}