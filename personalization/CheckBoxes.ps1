
# Do not use item check boxes
Function DisableCheckBoxes {
	Write-Output "Disabling CheckBoxes ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AutoCheckSelect -PropertyType DWord -Value 0 -Force	
}

# Use check item check boxes
Function EnableCheckBoxes {
	Write-Output "Enabling CheckBoxes ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name AutoCheckSelect -PropertyType DWord -Value 1 -Force	
}