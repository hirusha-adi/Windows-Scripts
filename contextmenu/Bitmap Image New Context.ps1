
# Hide the "Bitmap image" item from the "New" context menu
Function HideBitmapImageNewContext {
    Write-Output "Hiding Bitmap Image New Context ..."
    if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed") {
        Remove-Item -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Force -ErrorAction Ignore
    }
}

# Show the "Bitmap image" item to the "New" context menu
Function ShowBitmapImageNewContext {
    Write-Output "Showing Bitmap Image New Context ..."
    if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*").State -eq "Installed") {
        if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew)) {
            New-Item -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Force
        }
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Name ItemName -PropertyType ExpandString -Value "@%systemroot%\system32\mspaint.exe,-59414" -Force
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.bmp\ShellNew -Name NullFile -PropertyType String -Value "" -Force
    }
    else {
        try {
            # Check the internet connection
            $Parameters = @{
                Uri              = "https://www.google.com"
                Method           = "Head"
                DisableKeepAlive = $true
                UseBasicParsing  = $true
            }
            if (-not (Invoke-WebRequest @Parameters).StatusDescription) {
                return
            }

            Write-Information -MessageData "" -InformationAction Continue
            Write-Verbose -Message $Localization.Patient -Verbose

            Get-WindowsCapability -Online -Name "Microsoft.Windows.MSPaint*" | Add-WindowsCapability -Online
        }
        catch [System.Net.WebException] {
            Write-Warning -Message $Localization.NoInternetConnection
            Write-Error -Message $Localization.NoInternetConnection -ErrorAction SilentlyContinue

            Write-Error -Message ($Localization.RestartFunction -f $MyInvocation.Line) -ErrorAction SilentlyContinue
        }
    }
}
