# Hide the Windows Ink Workspace button on the taskbar
Function HideWindowsInkWorkspace {
	Write-Output "Hiding Windows Ink Workspace ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace -Name PenWorkspaceButtonDesiredVisibility -PropertyType DWord -Value 0 -Force
}

# Show the Windows Ink Workspace button on the taskbar
Function ShowWindowsInkWorkspace {
	Write-Output "Showing Windows Ink Workspace ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PenWorkspace -Name PenWorkspaceButtonDesiredVisibility -PropertyType DWord -Value 1 -Force
}