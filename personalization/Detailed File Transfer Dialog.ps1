
# Show the file transfer dialog box in the detailed mode
Function DetailedFileTransferDialog {
	Write-Output "Setting Detailed File Transfer Dialog ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Name EnthusiastMode -PropertyType DWord -Value 1 -Force	
}

# Show the file transfer dialog box in the compact mode
Function CompactFileTransferDialog {
	Write-Output "Setting Compact File Transfer Dialog ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager -Name EnthusiastMode -PropertyType DWord -Value 0 -Force
}