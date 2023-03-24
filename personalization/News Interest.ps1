
# Disable "News and Interests" on the taskbar
Function DisableNewsInterests {
	Write-Output "Disabling News Interest ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds -Name ShellFeedsTaskbarViewMode -PropertyType DWord -Value 2 -Force
}

# Enable "News and Interests" on the taskbar
Function EnableNewsInterests {
	Write-Output "Enabling News Interest ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Feeds -Name ShellFeedsTaskbarViewMode -PropertyType DWord -Value 0 -Force
}