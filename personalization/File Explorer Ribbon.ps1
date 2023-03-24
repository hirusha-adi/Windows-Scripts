# Expand the File Explorer ribbon
Function ExpandedFileExplorerRibbon {
	Write-Output "Setting Expanded File Explorer Ribbon ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Name MinimizedStateTabletModeOff -PropertyType DWord -Value 0 -Force
}

# Minimize the File Explorer ribbon
Function MinimizedFileExplorerRibbon {
	Write-Output "Setting Minimized File Explorer Ribbon ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon -Name MinimizedStateTabletModeOff -PropertyType DWord -Value 1 -Force
}