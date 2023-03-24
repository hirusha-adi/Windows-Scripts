# Do not show sync provider notification within File Explorer
Function HideOneDriveFileExplorerAd {
	Write-Output "Hiding OneDrive File Explorer Ad ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -PropertyType DWord -Value 0 -Force
}

# Show sync provider notification within File Explorer
Function ShowOneDriveFileExplorerAd {
	Write-Output "Showing OneDrive File Explorer Ad ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSyncProviderNotifications -PropertyType DWord -Value 1 -Force
}