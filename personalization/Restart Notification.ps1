# Notify me when a restart is required to finish updating
Function ShowRestartNotification {
	Write-Output "Showing Restart Notification ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name RestartNotificationsAllowed2 -PropertyType DWord -Value 1 -Force
}

# Do not notify me when a restart is required to finish updating
Function HideRestartNotification {
	Write-Output "Hiding Restart Notification ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name RestartNotificationsAllowed2 -PropertyType DWord -Value 0 -Force
}