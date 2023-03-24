
# Open File Explorer to "This PC"
Function ThisPCOpenFileExplorerTo {
	Write-Output "This PC Open File Explorer To ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -PropertyType DWord -Value 1 -Force
}

# Open File Explorer to Quick access
Function QuickAccessOpenFileExplorerTo {
	Write-Output "Quick Access Open File Explorer To ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -PropertyType DWord -Value 2 -Force		
}