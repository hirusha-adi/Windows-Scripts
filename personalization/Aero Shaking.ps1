# When I grab a windows's title bar and shake it, don't minimize all other windows
Function DisableAeroShaking {
	Write-Output "Disabling Aero Shaking ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DisallowShaking -PropertyType DWord -Value 1 -Force
}

# When I grab a windows's title bar and shake it, minimize all other windows
Function EnableAeroShaking {
	Write-Output "Enabling Aero Shaking ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name DisallowShaking -PropertyType DWord -Value 0 -Force
}