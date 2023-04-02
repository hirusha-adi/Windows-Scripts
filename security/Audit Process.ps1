# Enable events auditing generated when a process is created (starts)
Function EnableAuditProcess {
    Write-Output "Enabling Audit Process ..."
    auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:enable /failure:enable
}

# Disable events auditing generated when a process is created (starts)
Function DisableAuditProcess {
    Write-Output "Disabling Audit Process ..."
    auditpol /set /subcategory:"{0CCE922B-69AE-11D9-BED3-505054503030}" /success:disable /failure:disable
}
