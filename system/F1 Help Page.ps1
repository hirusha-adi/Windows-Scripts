# Disable help lookup via F1
Function DisableF1HelpPage {
	Write-Output "Disabling F1 Help Page ..."
	if (-not (Test-Path -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64"))
	{
		New-Item -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" -Force
	}
	New-ItemProperty -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" -Name "(default)" -PropertyType String -Value "" -Force
}

# Enable help lookup via F1
Function EnableF1HelpPage {
	Write-Output "Enabling F1 Help Page ..."
	Remove-Item -Path "HKCU:\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}" -Recurse -Force -ErrorAction Ignore
}