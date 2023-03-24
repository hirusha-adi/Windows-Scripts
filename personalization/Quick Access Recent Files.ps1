# Hide recently used files in Quick access
Function HideQuickAccessRecentFiles {
	Write-Output "Hiding Quick Access Recent Files ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -PropertyType DWord -Value 0 -Force
}

# Show recently used files in Quick access
Function ShowQuickAccessRecentFiles {
	Write-Output "Showing Quick Access Recent Files ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name ShowRecent -PropertyType DWord -Value 1 -Force
}