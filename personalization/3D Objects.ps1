# Hide the "3D Objects" folder in "This PC" and Quick access
Function Hide3DObjects {
	Write-Output "Hiding 3D Objects ..."
	if (-not (Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag"))
	{
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Force
	}
	New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name ThisPCPolicy -PropertyType String -Value Hide -Force		
}

# Show the "3D Objects" folder in "This PC" and Quick access
Function Show3DObjects{
	Write-Output "Showing 3D Objects ..."
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" -Name ThisPCPolicy -Force -ErrorAction Ignore		
}