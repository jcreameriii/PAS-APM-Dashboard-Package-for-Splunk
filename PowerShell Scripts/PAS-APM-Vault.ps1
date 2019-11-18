#Service Status Check for Vault Server
$HostName = "$env:computername"
$PORT = 51444
$SYSLOGSERVER="10.0.0.2"
$Version = "1.0.0000"

#PrivateArk Server Service Check
$MonitorType = "ApplicationMonitor"
$ServiceName = Get-Service "PrivateArk Server" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Server" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$syslogoutput = "CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)

#PrivateArk Database Service Check
$MonitorType = "ApplicationMonitor"
$ServiceName = Get-Service "PrivateArk Database" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Database" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$syslogoutput = "CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)

#CyberArk Logic Container Service Check
$MonitorType = "ApplicationMonitor"
$ServiceName = Get-Service "CyberArk Logic Container" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "CyberArk Logic Container" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$syslogoutput = "CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)

#PrivateArk Remote Control Agent Service Check
$MonitorType = "ApplicationMonitor"
$ServiceName = Get-Service "PrivateArk Remote Control Agent" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Remote Control Agent" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$syslogoutput = "CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)

#Cyber-Ark Event Notification Engine Service Check
$MonitorType = "ApplicationMonitor"
$ServiceName = Get-Service "Cyber-Ark Event Notification Engine" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "Cyber-Ark Event Notification Engine" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$syslogoutput = "CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)
