# Hide the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested
Function HideWindowsWelcomeExperience {
	Write-Output "Hiding Windows Welcome Experience ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-310093Enabled -PropertyType DWord -Value 0 -Force
}

# Show the Windows welcome experiences after updates and occasionally when I sign in to highlight what's new and suggested
Function ShowWindowsWelcomeExperience {
	Write-Output "Showing Windows Welcome Experience ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-310093Enabled -PropertyType DWord -Value 1 -Force
}