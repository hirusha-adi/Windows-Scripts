
# Do not let UWP apps run in the background
Function DisableBackgroundUWPApps {
    Write-Output "Disabling Background UWP Apps ..."
    # Remove all excluded apps running in the background
    Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications | ForEach-Object -Process {
        Remove-ItemProperty -Path $_.PsPath -Name * -Force
    }

    # Exclude apps from the Bundle only
    $BackgroundAccessApplications = @((Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications).PSChildName)
    $ExcludedBackgroundAccessApplications = @()
    foreach ($BackgroundAccessApplication in $BackgroundAccessApplications) {
        if (Get-AppxPackage -PackageTypeFilter Bundle -AllUsers | Where-Object -FilterScript { $_.PackageFamilyName -eq $BackgroundAccessApplication }) {
            $ExcludedBackgroundAccessApplications += $BackgroundAccessApplication
        }
    }

    Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications | Where-Object -FilterScript { $_.PSChildName -in $ExcludedBackgroundAccessApplications } | ForEach-Object -Process {
        New-ItemProperty -Path $_.PsPath -Name Disabled -PropertyType DWord -Value 1 -Force
        New-ItemProperty -Path $_.PsPath -Name DisabledByUser -PropertyType DWord -Value 1 -Force
    }

    # Open the "Background apps" page
    Start-Process -FilePath ms-settings:privacy-backgroundapps
}

# Let all UWP apps run in the background
Function EnableBackgroundUWPApps {
    Write-Output "Enabling Background UWP Apps ..."
    Get-ChildItem -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications | ForEach-Object -Process {
        Remove-ItemProperty -Path $_.PsPath -Name * -Force
    }
}
