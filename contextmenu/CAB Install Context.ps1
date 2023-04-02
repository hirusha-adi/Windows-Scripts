
# Show the "Install" item in the Cabinet (.cab) filenames extensions context menu
Function ShowCABInstallContext {
    Write-Output "Showing CAB Install Context ..."
    if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs\Command)) {
        New-Item -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs\Command -Force
    }
    $Value = "{0}" -f "cmd /c DISM.exe /Online /Add-Package /PackagePath:`"%1`" /NoRestart & pause"
    New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs\Command -Name "(default)" -PropertyType String -Value $Value -Force
    New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs -Name MUIVerb -PropertyType String -Value "@shell32.dll,-10210" -Force
    New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs -Name HasLUAShield -PropertyType String -Value "" -Force
}

# Hide the "Install" item from the Cabinet (.cab) filenames extensions context menu
Function HideCABInstallContext {
    Write-Output "Hiding CAB Install Context ..."
    Remove-Item -Path Registry::HKEY_CLASSES_ROOT\CABFolder\Shell\RunAs -Recurse -Force -ErrorAction Ignore
}