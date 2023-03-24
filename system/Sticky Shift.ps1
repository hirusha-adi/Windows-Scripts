
# Turn off pressing the Shift key 5 times to turn Sticky keys
Function DisableStickyShift {
	Write-Output "Disabling Sticky Shift ..."
	New-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -PropertyType String -Value 506 -Force
}

# Turn on pressing the Shift key 5 times to turn Sticky keys
Function EnableStickyShift {
	Write-Output "Enabling Sticky Shift ..."
	New-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name Flags -PropertyType String -Value 510 -Force
}