#Service Status Check for Vault Server
$HostName = "$env:computername"
$PORT = 51444
$SYSLOGSERVER="10.0.0.2"
$Version = "1.0.0000"
$Date = Get-Date
$DateTime = $DATE.ToString("yyyy-MM-ddTHH:mm:ssZ")

#PrivateArk Server Service Check
$MonitorType = "ApplicationMonitor"
$ServiceName = Get-Service "PrivateArk Server" | Format-Table -HideTableHeaders Name | Out-String
$ServiceStatus = Get-Service "PrivateArk Server" | Format-Table -HideTableHeaders Status | Out-String
    If ($ServiceStatus -like "*Running*") { $ServiceStatusNumeric = 1 } else { $ServiceStatusNumeric = 0 }
$SoftwareName = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object DisplayName -like "*CyberArk Digital Vault*" | Select-Object DisplayName | Select -first 1 | Format-Table -HideTableHeaders | Out-String
$SoftwareVersion = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object DisplayName -like "*CyberArk Digital Vault*" | Select-Object DisplayVersion | Select -first 1 | Format-Table -HideTableHeaders | Out-String
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|$SoftwareName|$SoftwareVersion"
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
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
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
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
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
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
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
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|$ServiceName|$ServiceStatus|$ServiceStatusNumeric|"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)

#OS System Information
$MonitorType = "OSMonitor"
$OSName = (Get-WmiObject Win32_OperatingSystem).Caption | Out-String
$OSVersion = (Get-WmiObject Win32_OperatingSystem).Version | Out-String
$OSServPack = (Get-WmiObject Win32_OperatingSystem).ServicePackMajorVersion | Out-String
$OSArchitecture = (Get-WmiObject Win32_OperatingSystem).OSArchitecture | Out-String
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|$OSName|$OSVersion|$OSServPack|$OSArchitecture"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)

#Admin Logon Information
$MonitorType = "LogonMonitor"
$SID = (Get-WMIObject -Class Win32_UserAccount -Filter {LocalAccount = "True" and Name = "Administrator"} | Select * | Format-Table -HideTableHeaders SID | Out-String)
$LastLogon = (net user Administrator | findstr /B /C:"Last logon")
$LastLogon = $LastLogon -replace "Last logon                   "
$syslogoutput = "$DateTime CEF:0|CyberArk|$MonitorType|$Version|$HostName|Administrator|$SID|$LastLogon"
#cleanup command to remove new lines and carriage returns
$syslogoutputclean = $syslogoutput -replace "`n|`r"
$syslogoutputclean | ConvertTo-Json
#send syslog to SIEM
$UDPCLient = New-Object System.Net.Sockets.UdpClient
$UDPCLient.Connect($SYSLOGSERVER, $PORT)
$Encoding = [System.Text.Encoding]::ASCII
$ByteSyslogMessage = $Encoding.GetBytes(''+$syslogoutputclean+'')
$UDPCLient.Send($ByteSyslogMessage, $ByteSyslogMessage.Length)
