# Do not let Windows manage my default printer
Function DisableWindowsManageDefaultPrinter {
	Write-Output "Disabling Windows Manage Default Printer ..."
	New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" -Name LegacyDefaultPrinterMode -PropertyType DWord -Value 1 -Force
}

# Let Windows manage my default printer
Function EnableWindowsManageDefaultPrinter {
	Write-Output "Enabling Windows Manage Default Printer ..."
	New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" -Name LegacyDefaultPrinterMode -PropertyType DWord -Value 0 -Force
}