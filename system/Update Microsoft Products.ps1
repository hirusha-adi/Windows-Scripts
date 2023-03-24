# Receive updates for other Microsoft products
Function EnableUpdateMicrosoftProducts {
	Write-Output "Enabling Update Microsoft Products ..."
	(New-Object -ComObject Microsoft.Update.ServiceManager).AddService2("7971f918-a847-4430-9279-4a52d1efe18d", 7, "")
}

# Do not receive updates for other Microsoft products
Function DisableUpdateMicrosoftProducts {
	Write-Output "Disabling Update Microsoft Products ..."
	if ((New-Object -ComObject Microsoft.Update.ServiceManager).Services | Where-Object -FilterScript {$_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d"})
	{
		(New-Object -ComObject Microsoft.Update.ServiceManager).RemoveService("7971f918-a847-4430-9279-4a52d1efe18d")
	}
}