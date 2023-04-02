# Enable sandboxing for Microsoft Defender
Function EnableDefenderSandbox {
    Write-Output "Enabling Defender Sandbox ..."
    if ((Get-MpComputerStatus).AntivirusEnabled -eq $true) {
        setx /M MP_FORCE_USE_SANDBOX 1
    }
}

# Disable sandboxing for Microsoft Defender
Function DisableDefenderSandbox {
    Write-Output "Disabling Defender Sandbox ..."
    if ((Get-MpComputerStatus).AntivirusEnabled -eq $true) {
        setx /M MP_FORCE_USE_SANDBOX 0
    }
}