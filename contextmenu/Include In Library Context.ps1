# Hide the "Include in Library" item from the folders and drives context menu
Function HideIncludeInLibraryContext {
    Write-Output "Hiding Include In Library Context ..."
    New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Library Location" -Name "(default)" -PropertyType String -Value "-{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" -Force
}


# Show the "Include in Library" item in the folders and drives context menu
Function ShowIncludeInLibraryContext {
    Write-Output "Showing Include In Library Context ..."
    New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\Folder\ShellEx\ContextMenuHandlers\Library Location" -Name "(default)" -PropertyType String -Value "{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" -Force
}