# Show folder merge conflicts
Function ShowMergeConflicts {
	Write-Output "Showing Merge Conflicts ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideMergeConflicts -PropertyType DWord -Value 0 -Force
}

# Hide folder merge conflicts
Function HideMergeConflicts {
	Write-Output "Hiding Merge Conflicts ..."
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name HideMergeConflicts -PropertyType DWord -Value 1 -Force
}