# Show the "Run as different user" item in the .exe filename extensions context menu
Function ShowRunAsDifferentUserContext {
    Write-Output "Showing Run As Different User Context ..."
    Remove-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\exefile\shell\runasuser -Name Extended -Force -ErrorAction Ignore
}

# Hide the "Run as different user" item from the .exe filename extensions context menu
Function HideRunAsDifferentUserContext {
    Write-Output "Hiding Run As Different User Context ..."
    New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\exefile\shell\runasuser -Name Extended -PropertyType String -Value "" -Force
}