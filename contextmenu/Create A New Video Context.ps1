
# Hide the "Create a new video" item from the media files context menu
Function HideCreateANewVideoContext {
    Write-Output "Hiding Create A New Video Context ..."
    if (Get-AppxPackage -Name Microsoft.Windows.Photos) {
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
    }
}

# Show the "Create a new video" item in the media files context menu
Function ShowCreateANewVideoContext {
    Write-Output "Showing Create A New Video Context ..."
    if (Get-AppxPackage -Name Microsoft.Windows.Photos) {
        Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
    }
}