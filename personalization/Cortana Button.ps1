# Hide Cortana button on the taskbar
Function HideCortanaButton {
	Write-Output "Hiding Cortana Button ..."
	if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
	{
		New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCortanaButton -PropertyType DWord -Value 0 -Force
	}
}

# Show Cortana button on the taskbar
Function ShowCortanaButton {
	Write-Output "Showing Cortana Button ..."
	if (Get-AppxPackage -Name Microsoft.549981C3F5F10)
	{
		New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name ShowCortanaButton -PropertyType DWord -Value 1 -Force
	}
}