# When I snap a window, do not show what I can snap next to it
Function DisableSnapAssist {
	Write-Output "Disabling Snap Assist ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SnapAssist -PropertyType DWord -Value 0 -Force		
}

# When I snap a window, show what I can snap next to it
Function EnableSnapAssist {
	Write-Output "Enabling Snap Assist ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name SnapAssist -PropertyType DWord -Value 1 -Force
}