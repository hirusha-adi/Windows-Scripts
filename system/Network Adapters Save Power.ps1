# Do not allow the computer to turn off the network adapters to save power
Function DisableNetworkAdaptersSavePower {
	Write-Output "Disabling Network Adapters Save Power ..."
	$Adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement | Where-Object -FilterScript {$_.AllowComputerToTurnOffDevice -ne "Unsupported"}
	foreach ($Adapter in $Adapters)
	{
		$Adapter.AllowComputerToTurnOffDevice = "Disabled"
		$Adapter | Set-NetAdapterPowerManagement
	}
}

# Allow the computer to turn off the network adapters to save power
Function EnableNetworkAdaptersSavePower {
	Write-Output "Enabling Network Adapters Save Power ..."
	$Adapters = Get-NetAdapter -Physical | Get-NetAdapterPowerManagement | Where-Object -FilterScript {$_.AllowComputerToTurnOffDevice -ne "Unsupported"}
	foreach ($Adapter in $Adapters)
	{
		$Adapter.AllowComputerToTurnOffDevice = "Enabled"
		$Adapter | Set-NetAdapterPowerManagement
	}
}