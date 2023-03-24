# Hide People button on the taskbar
Function HidePeopleTaskbar {
	Write-Output "Hiding People Taskbar ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Name PeopleBand -PropertyType DWord -Value 0 -Force
}

# Show People button on the taskbar
Function ShowPeopleTaskbar {
	Write-Output "Showing People Taskbar ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Name PeopleBand -PropertyType DWord -Value 1 -Force
}