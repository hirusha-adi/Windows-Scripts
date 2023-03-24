
# Start Task Manager in the expanded mode
Function ExpandedTaskManagerWindow {
	Write-Output "Setting Expanded Task Manager Window ..."
	$Taskmgr = Get-Process -Name Taskmgr -ErrorAction Ignore

	Start-Sleep -Seconds 1

	if ($Taskmgr)
	{
		$Taskmgr.CloseMainWindow()
	}
	Start-Process -FilePath Taskmgr.exe -PassThru

	Start-Sleep -Seconds 3

	do
	{
		Start-Sleep -Milliseconds 100
		$Preferences = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences
	}
	until ($Preferences)

	Stop-Process -Name Taskmgr -ErrorAction Ignore

	$Preferences[28] = 0
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences -PropertyType Binary -Value $Preferences -Force
}

# Start Task Manager in the compact mode
Function CompactTaskManagerWindow {
	Write-Output "Setting Compact Task Manager Window ..."
	$Taskmgr = Get-Process -Name Taskmgr -ErrorAction Ignore

	Start-Sleep -Seconds 1

	if ($Taskmgr)
	{
		$Taskmgr.CloseMainWindow()
	}
	Start-Process -FilePath Taskmgr.exe -PassThru

	Start-Sleep -Seconds 3

	do
	{
		Start-Sleep -Milliseconds 100
		$Preferences = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences
	}
	until ($Preferences)

	Stop-Process -Name Taskmgr -ErrorAction Ignore
	$Preferences[28] = 1
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\TaskManager -Name Preferences -PropertyType Binary -Value $Preferences -Force
}
