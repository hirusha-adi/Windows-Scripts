
# Automatically adjust active hours for me based on daily usage
Function AutomaticallyActiveHours {
	Write-Output "Setting Automatically Active Hours ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name SmartActiveHoursState -PropertyType DWord -Value 1 -Force
}

# Manually adjust active hours for me based on daily usage
Function ManuallyActiveHours {
	Write-Output "Setting Manually Active Hours ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings -Name SmartActiveHoursState -PropertyType DWord -Value 0 -Force
}