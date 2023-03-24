# Always wait for the network at computer startup and logon for workgroup networks
Function EnableWaitNetworkStartup {
	Write-Output "Enabling Wait Network Startup ..."
	if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $true)
	{
		if (-not (Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon"))
		{
			New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Force
		}
		New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -PropertyType DWord -Value 1 -Force
		#Set-Policy -Scope Computer -Path "SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -Type DWORD -Value 1			
	}
}

# Never wait for the network at computer startup and logon for workgroup networks
Function DisableWaitNetworkStartup {
	Write-Output "Disabling Wait Network Startup ..."
	if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $true)
	{
		Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -Force -ErrorAction Ignore
		#Set-Policy -Scope Computer -Path "SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name SyncForegroundPolicy -Type CLEAR			
	}
}
