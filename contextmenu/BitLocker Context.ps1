# Hide the "Turn on BitLocker" item from the drives context menu
Function HideBitLockerContext {
    Write-Output "Hiding BitLocker Context ..."
    if (Get-WindowsEdition -Online | Where-Object -FilterScript { ($_.Edition -eq "Professional") -or ($_.Edition -like "Enterprise*") }) {
        if ((Get-BitLockerVolume).ProtectionStatus -eq "Off") {
            New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde-elev -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
        }
    }
}

# Show the "Turn on BitLocker" item in the drives context menu
Function ShowBitLockerContext {
    Write-Output "Showing BitLocker Context ..."
    if (Get-WindowsEdition -Online | Where-Object -FilterScript { $_.Edition -eq "Professional" -or $_.Edition -like "Enterprise*" }) {
        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Drive\shell\encrypt-bde-elev -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
    }
}
