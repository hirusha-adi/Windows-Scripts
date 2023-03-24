# Set power plan on "High performance"
Function HighPowerPlan {
	Write-Output "Setting High Power Plan ..."
	POWERCFG /SETACTIVE SCHEME_MIN
}

# Set power plan on "Balanced"
Function BalancedPowerPlan {
	Write-Output "Setting Balanced Power Plan ..."
	POWERCFG /SETACTIVE SCHEME_BALANCED
}