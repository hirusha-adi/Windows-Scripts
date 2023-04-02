# Disable apps and files checking within Microsoft Defender SmartScreen
Function DisableAppsSmartScreen {
    Write-Output "Disabling Apps SmartScreen ..."
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name SmartScreenEnabled -PropertyType String -Value Off -Force
}

# Enable apps and files checking within Microsoft Defender SmartScreen
Function EnableAppsSmartScreen {
    Write-Output "Enabling Apps SmartScreen ..."
    New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer -Name SmartScreenEnabled -PropertyType String -Value Warn -Force
}