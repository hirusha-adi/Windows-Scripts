# Save screenshots by pressing Win+PrtScr on the Desktop
Function DesktopWinPrtScrFolder {
	Write-Output "Setting Desktop Win+PrtScr Folder ..."
	$DesktopFolder = Get-ItemPropertyValue -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name Desktop
	New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{B7BEDE81-DF94-4682-A7D8-57A52620B86F}" -Type ExpandString -Value $DesktopFolder -Force
}

# Save screenshots by pressing Win+PrtScr in the Pictures folder
Function DefaultWinPrtScrFolder {
	Write-Output "Setting Default Win+PrtScr Folder ..."
	Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "{B7BEDE81-DF94-4682-A7D8-57A52620B86F}" -Force -ErrorAction Ignore
}