# Do not add the "- Shortcut" suffix to the file name of created shortcuts
Function DisableShortcutsSuffix {
	Write-Output "Disabling Shortcuts Suffix ..."
	if (-not (Test-Path -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates))
	{
		New-Item -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Force
	}
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Name ShortcutNameTemplate -PropertyType String -Value "%s.lnk" -Force
}

# Add the "- Shortcut" suffix to the file name of created shortcuts
Function EnableShortcutsSuffix {
	Write-Output "Enabling Shortcuts Suffix ..."
	Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates -Name ShortcutNameTemplate -Force -ErrorAction Ignore
}