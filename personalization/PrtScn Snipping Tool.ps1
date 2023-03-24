# Use the Print screen button to open screen snipping
Function EnablePrtScnSnippingTool {
	Write-Output "Enabling PrtScn Snipping Tool ..."
	New-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name PrintScreenKeyForSnippingEnabled -PropertyType DWord -Value 1 -Force
}

# Do not use the Print screen button to open screen snipping
Function DisablePrtScnSnippingTool {
	Write-Output "Disabling PrtScn Snipping Tool ..."
	New-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name PrintScreenKeyForSnippingEnabled -PropertyType DWord -Value 0 -Force
}