# Disable Bing search in the Start Menu
Function DisableBingSearch {
	Write-Output "Disabling Bing Search ..."
	if (-not (Test-Path -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer))
	{
		New-Item -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Force
	}
	New-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -PropertyType DWord -Value 1 -Force		
}

# Enable Bing search in the Start Menu
Function EnableBingSearch {
	Write-Output "Enabling Bing Search ..."
	Remove-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -Force -ErrorAction Ignore
	#Set-Policy -Scope User -Path Software\Policies\Microsoft\Windows\Explorer -Name DisableSearchBoxSuggestions -Type CLEAR
}