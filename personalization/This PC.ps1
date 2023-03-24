# Show the "This PC" icon on Desktop
Function ShowThisPC {
	Write-Output "Showing This PC ..."
	if (-not (Test-Path -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel))
	{
		New-Item -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Force
	}
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -PropertyType DWord -Value 0 -Force
}

# Hide the "This PC" icon on Desktop
Function HideThisPC {
	Write-Output "Hiding This PC ..."
	Remove-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Force -ErrorAction Ignore
}