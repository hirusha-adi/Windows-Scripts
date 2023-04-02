# Enable detection for potentially unwanted applications and block them
Function EnablePUAppsDetection {
    Write-Output "Enabling PU Apps Detection ..."
    if ((Get-MpComputerStatus).AntivirusEnabled -eq $true) {
        Set-MpPreference -PUAProtection Enabled
    }
}

# Disable detection for potentially unwanted applications and block them
Function DisablePUAppsDetection {
    Write-Output "Disabling PU Apps Detection ..."
    if ((Get-MpComputerStatus).AntivirusEnabled -eq $true) {
        Set-MpPreference -PUAProtection Disabled
    }
}