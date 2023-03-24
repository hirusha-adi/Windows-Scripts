# Show file name extensions
Function ShowFileExtensions {
	Write-Output "Showing File Extensions ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -PropertyType DWord -Value 0 -Force		
}

# Hide file name extensions
Function HideFileExtensions {
	Write-Output "Hiding File Extensions ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideFileExt -PropertyType DWord -Value 1 -Force		
}