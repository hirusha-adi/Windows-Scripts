# Use the latest installed .NET runtime for all apps
Function EnableLatestInstalledNET {
	Write-Output "Enabling Latest Installed .NET ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework -Name OnlyUseLatestCLR -PropertyType DWord -Value 1 -Force
	New-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework -Name OnlyUseLatestCLR -PropertyType DWord -Value 1 -Force
}

# Do not use the latest installed .NET runtime for all apps
Function DisableLatestInstalledNET {
	Write-Output "Disabling Latest Installed .NET ..."
	Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\.NETFramework -Name OnlyUseLatestCLR -Force -ErrorAction Ignore
	Remove-ItemProperty -Path HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NETFramework -Name OnlyUseLatestCLR -Force -ErrorAction Ignore
}