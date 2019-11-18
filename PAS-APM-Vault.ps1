#Service Status Check for Vault Server
$HostName = "VAULT"
$PORT = 51444
$SYSLOGSERVER="10.0.0.2"
#PrivateArk Server Service Check
$ServiceName = Get-Service "PrivateArk Server" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Server" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$Date = Get-Date
$DateTime = $DATE.ToString("yyyy-MM-ddTHH:mm:ssZ")
$syslogoutput = "$DateTime, $HostName, $ServiceName, $ServiceStatus, $ServiceStatusNumeric"
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
$ServiceName = Get-Service "PrivateArk Database" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Database" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$Date = Get-Date
$DateTime = $DATE.ToString("yyyy-MM-ddTHH:mm:ssZ")
$syslogoutput = "$DateTime, $HostName, $ServiceName, $ServiceStatus, $ServiceStatusNumeric"
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
$ServiceName = Get-Service "CyberArk Logic Container" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "CyberArk Logic Container" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$Date = Get-Date
$DateTime = $DATE.ToString("yyyy-MM-ddTHH:mm:ssZ")
$syslogoutput = "$DateTime, $HostName, $ServiceName, $ServiceStatus, $ServiceStatusNumeric"
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
$ServiceName = Get-Service "PrivateArk Remote Control Agent" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Remote Control Agent" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$Date = Get-Date
$DateTime = $DATE.ToString("yyyy-MM-ddTHH:mm:ssZ")
$syslogoutput = "$DateTime, $HostName, $ServiceName, $ServiceStatus, $ServiceStatusNumeric"
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
$ServiceName = Get-Service "Cyber-Ark Event Notification Engine" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "Cyber-Ark Event Notification Engine" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$Date = Get-Date
$DateTime = $DATE.ToString("yyyy-MM-ddTHH:mm:ssZ")
$syslogoutput = "$DateTime, $HostName, $ServiceName, $ServiceStatus, $ServiceStatusNumeric"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)