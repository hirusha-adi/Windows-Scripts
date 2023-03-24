# Do not let Microsoft offer you tailored experiences based on the diagnostic data setting you have chosen
Function DisableTailoredExperiences {
	Write-Output "Disabling Tailored Experiences ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy -Name TailoredExperiencesWithDiagnosticDataEnabled -PropertyType DWord -Value 0 -Force		
}

# Let Microsoft offer you tailored experiences based on the diagnostic data setting you have chosen
Function EnableTailoredExperiences {
	Write-Output "Enabling Tailored Experiences ..."
	New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy -Name TailoredExperiencesWithDiagnosticDataEnabled -PropertyType DWord -Value 1 -Force		
}