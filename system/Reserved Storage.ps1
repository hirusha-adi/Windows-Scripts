# Disable and delete reserved storage after the next update installation
Function DisableReservedStorage {
	Write-Output "Disabling Reserved Storage ..."
	try
	{
		Set-WindowsReservedStorageState -State Disabled
	}
	catch [System.Runtime.InteropServices.COMException]
	{
		Write-Error -Message ($Localization.ReservedStorageIsInUse -f $MyInvocation.Line) -ErrorAction SilentlyContinue
	}
}

# Enable reserved storage after the next update installation
Function EnableReservedStorage {
	Write-Output "Enabling Reserved Storage ..."
	Set-WindowsReservedStorageState -State Enabled
}