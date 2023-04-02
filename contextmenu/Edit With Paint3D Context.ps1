# Hide the "Edit with Paint 3D" item from the media files context menu
Function HideEditWithPaint3DContext {
    Write-Output "Hiding Edit With Paint3D Context ..."
    if (Get-AppxPackage -Name Microsoft.MSPaint) {
        $Extensions = @(".bmp", ".gif", ".jpe", ".jpeg", ".jpg", ".png", ".tif", ".tiff")
        foreach ($Extension in $Extensions) {
            New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\$Extension\Shell\3D Edit" -Name ProgrammaticAccessOnly -PropertyType String -Value "" -Force
        }
    }
}

# Show the "Edit with Paint 3D" item in the media files context menu
Function ShowEditWithPaint3DContext {
    Write-Output "Showing Edit With Paint3D Context ..."
    if (Get-AppxPackage -Name Microsoft.MSPaint) {
        $Extensions = @(".bmp", ".gif", ".jpe", ".jpeg", ".jpg", ".png", ".tif", ".tiff")
        foreach ($Extension in $Extensions) {
            Remove-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\SystemFileAssociations\$Extension\Shell\3D Edit" -Name ProgrammaticAccessOnly -Force -ErrorAction Ignore
        }
    }
}