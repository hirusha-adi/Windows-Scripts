# Enable "Network Discovery" and "File and Printers Sharing" for workgroup networks
Function EnableNetworkDiscovery {
	Write-Output "Enabling Network Discovery ..."
	$FirewallRules = @(
		# File and printer sharing		
		"@FirewallAPI.dll,-32752",

		# Network discovery
		"@FirewallAPI.dll,-28502"
	)
	if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $false)
	{
		Set-NetFirewallRule -Group $FirewallRules -Profile Private -Enabled True
		Set-NetFirewallRule -Profile Public, Private -Name FPS-SMB-In-TCP -Enabled True
		Set-NetConnectionProfile -NetworkCategory Private
	}
}

# Disable "Network Discovery" and "File and Printers Sharing" for workgroup networks
Function DisableNetworkDiscovery {
	Write-Output "Disabling Network Discovery ..."
	$FirewallRules = @(
		# File and printer sharing		
		"@FirewallAPI.dll,-32752",

		# Network discovery
		"@FirewallAPI.dll,-28502"
	)
	if ((Get-CimInstance -ClassName CIM_ComputerSystem).PartOfDomain -eq $false)
	{
		Set-NetFirewallRule -Group $FirewallRules -Profile Private -Enabled False
	}
}