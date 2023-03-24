# Change the feedback frequency to "Never"
Function NeverFeedbackFrequency {
	Write-Output "Setting Never Feedback Frequency ..."
	if (-not (Test-Path -Path HKCU:\Software\Microsoft\Siuf\Rules))
	{
		New-Item -Path HKCU:\Software\Microsoft\Siuf\Rules -Force
	}
	New-ItemProperty -Path HKCU:\Software\Microsoft\Siuf\Rules -Name NumberOfSIUFInPeriod -PropertyType DWord -Value 0 -Force
}

# Change feedback frequency to "Automatically"
Function AutomaticallyFeedbackFrequency {
	Write-Output "Setting Automatically Feedback Frequency ..."
	Remove-Item -Path HKCU:\Software\Microsoft\Siuf\Rules -Force -ErrorAction Ignore
}