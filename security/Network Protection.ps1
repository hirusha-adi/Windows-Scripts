# Enable Microsoft Defender Exploit Guard network protection
Function EnableNetworkProtection {
    Write-Output "Enabling Network Protection ..."
    if ((Get-MpComputerStatus).AntivirusEnabled -eq $true) {
        Set-MpPreference -EnableNetworkProtection Enabled
    }
}

# Disable Microsoft Defender Exploit Guard network protection
Function DisableNetworkProtection {
    Write-Output "Disabling Network Protection ..."
    if ((Get-MpComputerStatus).AntivirusEnabled -eq $true) {
        Set-MpPreference -EnableNetworkProtection Disabled
    }
}