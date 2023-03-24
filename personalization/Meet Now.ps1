
# Hide the Meet Now icon in the notification area
Function HideMeetNow {
	Write-Output "Hiding Meet Now ..."
	$Settings = Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -ErrorAction Ignore
	$Settings[9] = 128
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -PropertyType Binary -Value $Settings -Force

}

# Show the Meet Now icon in the notification area
Function ShowMeetNow {
	Write-Output "Showing Meet Now ..."
	$Settings = Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -ErrorAction Ignore
	$Settings[9] = 0
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3 -Name Settings -PropertyType Binary -Value $Settings -Force

}