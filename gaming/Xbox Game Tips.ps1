# Disable Xbox Game Bar tips
Function DisableXboxGameTips {
    Write-Output "Disabling Xbox Game Tips ..."
    if ((Get-AppxPackage -Name Microsoft.XboxGamingOverlay) -or (Get-AppxPackage -Name Microsoft.GamingApp)) {
        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\GameBar -Name ShowStartupPanel -PropertyType DWord -Value 0 -Force
    }
}

# Enable Xbox Game Bar tips
Function EnableXboxGameTips {
    Write-Output "Enabling Xbox Game Tips ..."
    if ((Get-AppxPackage -Name Microsoft.XboxGamingOverlay) -or (Get-AppxPackage -Name Microsoft.GamingApp)) {
        New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\GameBar -Name ShowStartupPanel -PropertyType DWord -Value 1 -Force
    }
}