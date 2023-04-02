# Hide recently added apps in the Start menu
Function HideRecentlyAddedApps {
    Write-Output "Hiding Recently Added Apps ..."
    if (-not (Test-Path -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer)) {
        New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Force
    }
    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecentlyAddedApps -PropertyType DWord -Value 1 -Force
}

# Show recently added apps in the Start menu
Function ShowRecentlyAddedApps {
    Write-Output "Showing Recently Added Apps ..."
    Remove-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer -Name HideRecentlyAddedApps -Force -ErrorAction Ignore
}