
# Show seconds on the taskbar clock
Function ShowSecondsInSystemClock {
	Write-Output "Showing Seconds In System Clock ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSecondsInSystemClock -PropertyType DWord -Value 1 -Force
}

# Hide seconds on the taskbar clock
Function HideSecondsInSystemClock {
	Write-Output "Hiding Seconds In System Clock ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowSecondsInSystemClock -PropertyType DWord -Value 0 -Force
}