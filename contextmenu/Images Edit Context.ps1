# Hide the "Edit" item from the images context menu
Function HideImagesEditContext {
    Write-Output "Hiding Images Edit Context ..."
    if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed") {
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\edit -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
    }
}

# Show the "Edit" item in the images context menu
Function ShowImagesEditContext {
    Write-Output "Showing Images Edit Context ..."
    if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed") {
        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\image\shell\edit -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
    }
}