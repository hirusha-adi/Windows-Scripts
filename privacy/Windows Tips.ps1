# Do not get tip and suggestions when I use Windows
Function DisableWindowsTips {
	Write-Output "Disabling Windows Tips ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338389Enabled -PropertyType DWord -Value 0 -Force
}

# Get tip and suggestions when I use Windows
Function EnableWindowsTips {
	Write-Output "Enabling Windows Tips ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Name SubscribedContent-338389Enabled -PropertyType DWord -Value 1 -Force		
}