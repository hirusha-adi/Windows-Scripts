# Hide the "Share" item from the context menu
Function HideShareContext {
    Write-Output "Hiding Share Context ..."
    Remove-Item -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" -Recurse -Force -ErrorAction Ignore
}

# Show the "Share" item in the context menu
Function ShowShareContext {
    Write-Output "Showing Share Context ..."
    if (-not (Test-Path -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing")) {
        New-Item -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" -Force
    }
    New-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\ModernSharing" -Name "(default)" -PropertyType String -Value "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" -Force		
}