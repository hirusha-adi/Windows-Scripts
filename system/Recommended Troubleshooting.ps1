
# Run troubleshooter automatically, then notify me
Function AutomaticallyRecommendedTroubleshooting {
	Write-Output "Setting Automatically Recommended Troubleshooting ..."
	if (-not (Test-Path -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation))
	{
		New-Item -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Force
	}
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Name UserPreference -PropertyType DWord -Value 3 -Force

	# Set the OS level of diagnostic data gathering to "Optional diagnostic data"
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -PropertyType DWord -Value 3 -Force
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name MaxTelemetryAllowed -PropertyType DWord -Value 3 -Force

	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack -Name ShowedToastAtLevel -PropertyType DWord -Value 3 -Force

	# Turn on Windows Error Reporting
	Get-ScheduledTask -TaskName QueueReporting | Enable-ScheduledTask
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Force -ErrorAction Ignore

	Get-Service -Name WerSvc | Set-Service -StartupType Manual
	Get-Service -Name WerSvc | Start-Service
}

# Ask me before running troubleshooter
Function DefaultRecommendedTroubleshooting {
	Write-Output "Setting Default Recommended Troubleshooting ..."
	if (-not (Test-Path -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation))
	{
		New-Item -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Force
	}
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WindowsMitigation -Name UserPreference -PropertyType DWord -Value 2 -Force

	# Set the OS level of diagnostic data gathering to "Optional diagnostic data"
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name AllowTelemetry -PropertyType DWord -Value 3 -Force
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection -Name MaxTelemetryAllowed -PropertyType DWord -Value 3 -Force

	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack -Name ShowedToastAtLevel -PropertyType DWord -Value 3 -Force

	# Turn on Windows Error Reporting
	Get-ScheduledTask -TaskName QueueReporting | Enable-ScheduledTask
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Force -ErrorAction Ignore

	Get-Service -Name WerSvc | Set-Service -StartupType Manual
	Get-Service -Name WerSvc | Start-Service
}
