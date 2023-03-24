# Disable the Windows 260 character path limit
Function DisableWin32LongPathLimit {
	Write-Output "Disabling Win32 Long Path Limit ..."
	New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name LongPathsEnabled -PropertyType DWord -Value 1 -Force
}

# Enable the Windows 260 character path limit
Function EnableWin32LongPathLimit {
	Write-Output "Enabling Win32 Long Path Limit ..."
	New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem -Name LongPathsEnabled -PropertyType DWord -Value 0 -Force
}