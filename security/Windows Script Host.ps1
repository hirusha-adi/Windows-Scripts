# Disable Windows Script Host
Function DisableWindowsScriptHost {
    Write-Output "Disabling Windows Script Host ..."
    if (-not (Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings")) {
        New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Force
    }
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name Enabled -PropertyType DWord -Value 0 -Force
}

# Enable Windows Script Host
Function EnableWindowsScriptHost {
    Write-Output "Enabling Windows Script Host ..."
    Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows Script Host\Settings" -Name Enabled -Force -ErrorAction Ignore
}