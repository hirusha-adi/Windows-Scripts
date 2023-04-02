# Show the search box on the taskbar
Function SearchBoxTaskbarSearch {
    Write-Output "Showing Search Box Taskbar Search ..."
    New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchboxTaskbarMode -PropertyType DWord -Value 2 -Force
}

# Taskbar Always combine, hide labels
Function AlwaysCombineHideLabelsTaskbar {
    Write-Output "Setting Taskbar to Always combine, hide labels ..."
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -PropertyType DWord -Value 0 -Force
}