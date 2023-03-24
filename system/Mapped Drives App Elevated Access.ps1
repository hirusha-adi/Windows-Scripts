# Turn on access to mapped drives from app running with elevated permissions with Admin Approval Mode enabled
Function EnableMappedDrivesAppElevatedAccess {
	Write-Output "Enabling Mapped Drives App Elevated Access ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLinkedConnections -PropertyType DWord -Value 1 -Force
}

# Turn off access to mapped drives from app running with elevated permissions with Admin Approval Mode enabled
Function DisableMappedDrivesAppElevatedAccess {
	Write-Output "Disabling Mapped Drives App Elevated Access ..."
	Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLinkedConnections -Force -ErrorAction Ignore
}