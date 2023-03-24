# Override for default input method: English
Function EnglishInputMethod {
	Write-Output "Setting English Input Method  ..."
	Set-WinDefaultInputMethodOverride -InputTip "0409:00000409"
}

# Override for default input method: use language list
Function DefaultInputMethod {
	Write-Output "Setting Default Input Method  ..."
	Remove-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name InputMethodOverride -Force -ErrorAction Ignore
}