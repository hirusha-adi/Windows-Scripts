# Run the Windows PowerShell shortcut from the Start menu as Administrator
Function ElevatedRunPowerShellShortcut {
    Write-Output "Setting Elevated Run PowerShell Shortcut ..."
    [byte[]]$bytes = Get-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Encoding Byte -Raw
    $bytes[0x15] = $bytes[0x15] -bor 0x20
    Set-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Value $bytes -Encoding Byte -Force
}

# Run the Windows PowerShell shortcut from the Start menu as user
Function NonElevatedRunPowerShellShortcut {
    Write-Output "Setting NonElevated Run PowerShell Shortcut ..."
    [byte[]]$bytes = Get-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Encoding Byte -Raw
    $bytes[0x15] = $bytes[0x15] -bxor 0x20
    Set-Content -Path "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" -Value $bytes -Encoding Byte -Force
}