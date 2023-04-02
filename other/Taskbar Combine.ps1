
# Taskbar Combine when taskbar is full
Function CombineWhenFullTaskbar {
    Write-Output "Setting Taskbar to combine when taskbar is full ..."
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -PropertyType DWord -Value 1 -Force
}

# Taskbar Never combine
Function NeverCombineTaskbar {
    Write-Output "Setting Taskbar to never combine ..."
    New-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -PropertyType DWord -Value 2 -Force
}