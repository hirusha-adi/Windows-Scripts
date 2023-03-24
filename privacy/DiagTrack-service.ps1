# Disable the Connected User Experiences and Telemetry (DiagTrack) service, and block connection for the Unified Telemetry Client Outbound Traffic
Function DisableDiagTrackService {
	Write-Output "Disabling DiagTrack Service ..."
	# Connected User Experiences and Telemetry
	Get-Service -Name DiagTrack | Stop-Service -Force
	Get-Service -Name DiagTrack | Set-Service -StartupType Disabled

	# Block connection for the Unified Telemetry Client Outbound Traffic
	Get-NetFirewallRule -Group DiagTrack | Set-NetFirewallRule -Enabled False -Action Block
}


# Enable the Connected User Experiences and Telemetry (DiagTrack) service, and allow connection for the Unified Telemetry Client Outbound Traffic
Function EnableDiagTrackService {
	Write-Output "Enabling DiagTrack Service ..."
	# Connected User Experiences and Telemetry
	Get-Service -Name DiagTrack | Set-Service -StartupType Automatic
	Get-Service -Name DiagTrack | Start-Service

	# Allow connection for the Unified Telemetry Client Outbound Traffic
	Get-NetFirewallRule -Group DiagTrack | Set-NetFirewallRule -Enabled True -Action Allow
}