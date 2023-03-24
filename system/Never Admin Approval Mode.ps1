# Never notify when apps try to make changes to my computer
Function NeverAdminApprovalMode {
	Write-Output "Setting Never Admin Approval Mode ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -PropertyType DWord -Value 0 -Force
}

# Notify me only when apps try to make changes to my computer
Function DefaultAdminApprovalMode {
	Write-Output "Setting Default Admin Approval Mode ..."
	New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -PropertyType DWord -Value 5 -Force
}