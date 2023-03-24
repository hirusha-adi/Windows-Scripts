# Display the Stop error information on the BSoD
Function EnableBSoDStopError {
	Write-Output "Enabling BSoD Stop Error ..."
	New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl -Name DisplayParameters -PropertyType DWord -Value 1 -Force
}

# Do not display the Stop error information on the BSoD
Function DisableBSoDStopError {
	Write-Output "Disabling BSoD Stop Error ..."
	New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Control\CrashControl -Name DisplayParameters -PropertyType DWord -Value 0 -Force
}