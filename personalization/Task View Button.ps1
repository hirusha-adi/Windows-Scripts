# Hide the Task view button on the taskbar
Function HideTaskViewButton {
	Write-Output "Hiding Task View Button ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -PropertyType DWord -Value 0 -Force
}

# Show the Task View button on the taskbar
Function ShowTaskViewButton {
	Write-Output "Showing Task View Button ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowTaskViewButton -PropertyType DWord -Value 1 -Force
}