# Hide the "Look for an app in the Microsoft Store" item in the "Open with" dialog
Function HideUseStoreOpenWith {
    Write-Output "Hiding Use Store Open With ..."
    if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer)) {
        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
    }
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoUseStoreOpenWith -PropertyType DWord -Value 1 -Force
}

# Show the "Look for an app in the Microsoft Store" item in the "Open with" dialog
Function ShowUseStoreOpenWith {
    Write-Output "Showing Use Store Open With ..."
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name NoUseStoreOpenWith -Force -ErrorAction Ignore
}