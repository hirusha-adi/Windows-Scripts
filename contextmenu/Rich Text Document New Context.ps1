
# Hide the "Rich Text Document" item from the "New" context menu
Function HideRichTextDocumentNewContext {
    Write-Output "Hiding Rich Text Document New Context ..."
    if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.WordPad*").State -eq "Installed") {
        Remove-Item -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Force -ErrorAction Ignore
    }
}

# Show the "Rich Text Document" item to the "New" context menu
Function ShowRichTextDocumentNewContext {
    Write-Output "Showing Rich Text Document New Context ..."
    if ((Get-WindowsCapability -Online -Name "Microsoft.Windows.WordPad*").State -eq "Installed") {
        if (-not (Test-Path -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew)) {
            New-Item -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Force
        }
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Name Data -PropertyType String -Value "{\rtf1}" -Force
        New-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\.rtf\ShellNew -Name ItemName -PropertyType ExpandString -Value "@%ProgramFiles%\Windows NT\Accessories\WORDPAD.EXE,-213" -Force
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

            Get-WindowsCapability -Online -Name "Microsoft.Windows.WordPad*" | Add-WindowsCapability -Online
        }
        catch [System.Net.WebException] {
            Write-Warning -Message $Localization.NoInternetConnection
            Write-Error -Message $Localization.NoInternetConnection -ErrorAction SilentlyContinue

            Write-Error -Message ($Localization.RestartFunction -f $MyInvocation.Line) -ErrorAction SilentlyContinue
        }
    }
}