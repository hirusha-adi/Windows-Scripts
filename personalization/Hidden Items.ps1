# Show hidden files, folders, and drives
Function EnableHiddenItems {
	Write-Output "Enabling Hidden Items ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -PropertyType DWord -Value 1 -Force		
}

# Do not show hidden files, folders, and drives
Function DisableHiddenItems {
	Write-Output "Disabling Hidden Items ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name Hidden -PropertyType DWord -Value 2 -Force
}