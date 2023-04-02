
# Enable hardware-accelerated GPU scheduling
Function EnableGPUScheduling {
    Write-Output "Enabling GPU Scheduling ..."
    if (Get-CimInstance -ClassName CIM_VideoController | Where-Object -FilterScript { ($_.AdapterDACType -ne "Internal") -and ($null -ne $_.AdapterDACType) }) {
        # Determining whether an OS is not installed on a virtual machine
        if ((Get-CimInstance -ClassName CIM_ComputerSystem).Model -notmatch "Virtual") {
            # Checking whether a WDDM verion is 2.7 or higher
            $WddmVersion_Min = Get-ItemPropertyValue -Path HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\FeatureSetUsage -Name WddmVersion_Min
            if ($WddmVersion_Min -ge 2700) {
                New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name HwSchMode -PropertyType DWord -Value 2 -Force
            }
        }
    }
}

# Disable hardware-accelerated GPU scheduling
Function DisableGPUScheduling {
    Write-Output "Disabling GPU Scheduling ..."
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -Name HwSchMode -PropertyType DWord -Value 1 -Force
}
