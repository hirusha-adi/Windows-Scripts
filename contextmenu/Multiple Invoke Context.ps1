# Enable the "Open", "Print", and "Edit" items if more than 15 files selected
Function EnableMultipleInvokeContext {
    Write-Output "Enabling Multiple Invoke Context ..."
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name MultipleInvokePromptMinimum -PropertyType DWord -Value 300 -Force
}

# Disable the "Open", "Print", and "Edit" items if more than 15 files selected
Function DisableMultipleInvokeContext {
    Write-Output "Disabling Multiple Invoke Context ..."
    Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name MultipleInvokePromptMinimum -Force -ErrorAction Ignore
}