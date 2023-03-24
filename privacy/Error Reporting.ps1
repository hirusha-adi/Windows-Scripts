# Turn off Windows Error Reporting
Function DisableErrorReporting {
	Write-Output "Disabling Error Reporting ..."
	if ((Get-WindowsEdition -Online).Edition -notmatch "Core")
	{
		Get-ScheduledTask -TaskName QueueReporting | Disable-ScheduledTask
		New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -PropertyType DWord -Value 1 -Force
	}

	Get-Service -Name WerSvc | Stop-Service -Force
	Get-Service -Name WerSvc | Set-Service -StartupType Disabled
}

# Turn on Windows Error Reporting
Function EnableErrorReporting {
	Write-Output "Enabling Error Reporting ..."
	Get-ScheduledTask -TaskName QueueReporting | Enable-ScheduledTask
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\Windows Error Reporting" -Name Disabled -Force -ErrorAction Ignore

	Get-Service -Name WerSvc | Set-Service -StartupType Manual
	Get-Service -Name WerSvc | Start-Service
}