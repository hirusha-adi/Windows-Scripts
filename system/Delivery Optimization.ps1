# Turn off Delivery Optimization
Function DisableDeliveryOptimization {
	Write-Output "Disabling Delivery Optimization ..."
	New-ItemProperty -Path Registry::HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings -Name DownloadMode -PropertyType DWord -Value 0 -Force
	Delete-DeliveryOptimizationCache -Force
}

# Turn on Delivery Optimization
Function EnableDeliveryOptimization {
	Write-Output "Enabling Delivery Optimization ..."
	New-ItemProperty -Path Registry::HKEY_USERS\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings -Name DownloadMode -PropertyType DWord -Value 1 -Force
}