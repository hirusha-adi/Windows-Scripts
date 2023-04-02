# Hide the search on the taskbar
Function HideTaskbarSearch {
    Write-Output "Hiding Taskbar Search ..."
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 0 -Force
}

# Show the search icon on the taskbar
Function SearchIconTaskbarSearch {
    Write-Output "Showing Search Icon Taskbar Search ..."
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 1 -Force
}