# Hide the "Edit with Photos" item from the media files context menu
Function HideEditWithPhotosContext {
    Write-Output "Hiding Edit With Photos Context ..."
    if (Get-AppxPackage -Name Microsoft.Windows.Photos) {
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
    }
}

# Show the "Edit with Photos" item in the media files context menu
Function ShowEditWithPhotosContext {
    Write-Output "Showing Edit With Photos Context ..."
    if (Get-AppxPackage -Name Microsoft.Windows.Photos) {
        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
    }
}