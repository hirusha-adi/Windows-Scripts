# Display the recycle bin files delete confirmation dialog
Function EnableRecycleBinDeleteConfirmation {
	Write-Output "Enabling Recycle Bin Delete Confirmation ..."
	$ShellState = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState
	$ShellState[4] = 51
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState -PropertyType Binary -Value $ShellState -Force
}

# Do not display the recycle bin files delete confirmation dialog
Function DisableRecycleBinDeleteConfirmation {
	Write-Output "Disabling Recycle Bin Delete Confirmation ..."
	$ShellState = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState
	$ShellState[4] = 55
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShellState -PropertyType Binary -Value $ShellState -Force	
}
