# Disable Windows Sandbox
Function DisableWindowsSandbox {
    Write-Output "Disabling Windows Sandbox ..."
    if (Get-WindowsEdition -Online | Where-Object -FilterScript { $_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*" }) {
        # Checking whether x86 virtualization is enabled in the firmware
        if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true) {
            Disable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -Online -NoRestart
        }
        else {
            try {
                # Determining whether Hyper-V is enabled
                if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true) {
                    Disable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -Online -NoRestart
                }
            }
            catch [System.Exception] {
                Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
            }
        }
    }
}

# Enable Windows Sandbox
Function EnableWindowsSandbox {
    Write-Output "Enabling Windows Sandbox ..."
    if (Get-WindowsEdition -Online | Where-Object -FilterScript { $_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*" }) {
        # Checking whether x86 virtualization is enabled in the firmware
        if ((Get-CimInstance -ClassName CIM_Processor).VirtualizationFirmwareEnabled -eq $true) {
            Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
        }
        else {
            try {
                # Determining whether Hyper-V is enabled
                if ((Get-CimInstance -ClassName CIM_ComputerSystem).HypervisorPresent -eq $true) {
                    Enable-WindowsOptionalFeature -FeatureName Containers-DisposableClientVM -All -Online -NoRestart
                }
            }
            catch [System.Exception] {
                Write-Error -Message $Localization.EnableHardwareVT -ErrorAction SilentlyContinue
            }
        }
    }
}
