
# Disable hibernation
Function DisableHibernation {
	Write-Output "Disabling Hibernation ..."
	POWERCFG /HIBERNATE OFF
}

# Enable hibernation
Function EnableHibernation {
	Write-Output "Enabling Hibernation ..."
	POWERCFG /HIBERNATE ON
}