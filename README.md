## CyberArk Privileged Access Security Application Performance Monitoring (APM) Dashboard Package for Splunk
The PAS APM dashboards are designed to show critical monitoring information for the CyberArk PAS application, including hardware (CPU/memory/disk) and software (service status, application statistics) information for Vault, CPM, PVWA, PSM and PTA.

## Motivation
This project was developed to make it easier for organizations leveraging CyberArk PAS to monitor the application performance from a centralized single pane of glass.

## Build Status
Beta v1.1 - Under Construction

## Screenshots
### All-In-One Dashboard:
![All-In-One Dashboard](/Screenshots/PAS-APM-AIO-Screenshot.PNG)

### PTA Dashboard:
![PVWA Dashboard](/Screenshots/PAS-APM-PTA-Screenshot.PNG)

### Vault Dashboard:
![Vault Dashboard](/Screenshots/PAS-APM-Vault-Screenshot.PNG)

### CPM Dashboard:
![CPM Dashboard](/Screenshots/PAS-APM-CPM-Screenshot.PNG)

### PSM Dashboard:
![PSM Dashboard](/Screenshots/PAS-APM-PSM-Screenshot.PNG)

### PVWA Dashboard:
![PVWA Dashboard](/Screenshots/PAS-APM-PVWA-Screenshot.PNG)

## Technologies Used
* PowerShell
* Task Scheduler
* Splunk (SIEM)
* SYSLOG Messages

## Installation & Configuration
### Vault Server(s) Configuration Steps:
1. Copy [PAS-APM-Vault.ps1](PowerShell%20Scripts/PAS-APM-Vault.ps1) to Vault Server(s)
2. Configure [PAS-APM-Vault.ps1](PowerShell%20Scripts/PAS-APM-Vault.ps1) to run as a scheduled task that runs every minute, indefinetly
3. Create non-standard firewall rule to allow outbound `UDP` traffic for the powershell script to send `SYSLOG` traffic out ONLY to the SIEM server
4. Modify the [PAS-APM-Vault.ps1](PowerShell%20Scripts/PAS-APM-Vault.ps1) to use whatever SIEM server/port information is appropriate for your configuraiton
5. Run the scheduled task and vadlidate that Splunk is receving the syslogs
6. If not already done, enable "Vault Monitor" syslog messages to be sent from your Vault Server(s) per [docs.cyberark.com](https://docs.cyberark.com/Product-Doc/OnlineHelp/PAS/Latest/en/Content/PASIMP/Integrating-with-SIEM-Applications.htm#MonitortheVaultinSIEMapplicationsusingSyslog) instructions

### Component Server(s) Configuration Steps:
1. Copy [PAS-APM-Components.ps1](PowerShell%20Scripts/PAS-APM-Components.ps1) to the Component Server(s)
2. Configure the [PAS-APM-Components.ps1](PowerShell%20Scripts/PAS-APM-Components.ps1) to run as a scheduled task that runs every minute, indefinetly 
3. Modify the [PAS-APM-Components.ps1](PowerShell%20Scripts/PAS-APM-Components.ps1) to only monitor for the required services on that component server (e.g. remove PSM relevant monitors for non-PSM servers, etc)
4. Run the scheduled task and validate that Splunk is receiving the syslogs

### PTA Server Configuration Steps
1. Be sure to configure the PTA server to send SYSLOGs outbound to Splunk per [docs.cyberark.com](https://docs.cyberark.com) instructions

### Splunk Configuration Steps:
1. Validate that Splunk is receiving the syslog messages from all the Vaults/Components
2. Once you have validated Splunk is reciving the messages, for you will need to define the Field names for the values in the syslog messages
3. To create the custom Fields, search for `*Monitor` for all CyberArk sources and click `+Extract New Fields`.
4. Click on `VaultMonitor` event to extract the fields. Select the `Delimiters` method and use the pipe `|`.
5. Rename `field1` through `field16` as follows: `Format|Vendor|Product|Version|Info1|Info2|Info3|Info4|Info5|Info6|Info7|Info8|Info9|Info10|Info11|Info12`
6. Click on "Dashboards" in Splunk
7. Click on "Create New Dashboard"
8. Enter the following title for each Dashboard:
9. CyberArk Performance Monitoring Dashboard: `All-In-One`
10. CyberArk Performance Monitoring Dashboard: `VAULT`
11. CyberArk Performance Monitoring Dashboard: `PVWA`
12. CyberArk Performance Monitoring Dashboard: `CPM`
13. CyberArk Performance Monitoring Dashboard: `PSM`
14. CyberArk Performance Monitoring Dashboard: `PVWA`
15. CyberArk Privileged Threat Analytics Dashboard: `PTA`
16. Click "Create Dashboard"
17. Click the "Source' button in the top left hand corner of the dashboard to modify the source code
18. Copy the source code from the corresponding .XML file and override all of the existing dashboard code
19. Click "Save" in the top right hand corner
20. Update all the queries in the dashboard's to include the correct sources/hosts for your environment. They are defaulted to the values of the Devleopment lab they were built in. You can also modify these values in the XML source code prior to creating the dashboards.
21. Test and troubleshoot as necessary.

#### Note:
1. If you're having issues with timestamps in Splunk being zulu time but are being viewed as though they are in your local time, change the `UseLegacySyslogFormat` to `Yes` for the Splunk configuraiton in your `dbparm.ini` file on the Vault server(s).
2. If you're having issues with identifying field names for the various types of monitors, create a custom field for each monitor type formatted the same way as mentioned in the Splunk configuration steps.
3. If you're having issues receiving the VaultMonitor records, be sure you've configured the Vault to send them per the documentation. If you're still having issues, make sure your translator file has the following XML code within it:
`</xsl:for-each>
	          <xsl:for-each select="syslog/monitor_record">CEF:0|<xsl:value-of select="Vendor"/>|<xsl:value-of select="Product"/>|<xsl:value-of select="Version"/>|<xsl:value-of select="AverageExecutionTime"/>|<xsl:value-of select="MaxExecutionTime"/>|<xsl:value-of select="AverageQueueTime"/>|<xsl:value-of select="MaxQueueTime"/>|<xsl:value-of select="NumberOfParallelTasks"/>|<xsl:value-of select="MaxParallelTasks"/>|<xsl:value-of select="TransactionCount"/>|<xsl:value-of select="CPUUsage"/>|<xsl:value-of select="MemoryUsage"/>|<xsl:value-of select="DriveFreeSpaceInGB"/>|<xsl:value-of select="DriveTotalSpaceInGB"/>|<xsl:value-of select="SyslogQueueSize"/>
      </xsl:for-each>`

## How To Use These Dashboards
These dashboards are designed to provide meaningful application performance monitoring information for the CyberArk PAS solution. Dashboards are broken up into three sections, (1) Service Status, (2) Hardware Performance Monitors, and (3) Application Performance Metrics. Each of these dashboards and the data they contain are unique to the component of the CyberArk PAS solution they're designed to monitor.

**Service Status:** The service status panels will provide information on the key services related to that component, including a color indiciator to determine whether the service is up or down quickly and the current service status.

**Hardware Performance Monitors:** The hardware performance monitor panels show `CPU Usage %`, `Memory Usage %` and `Disk Space Usage` over a period of time and the current level. It, too, includes a color incidator to detmeine whether there is an immedaite issue that requires attention.

**Application Metrics:** The application metrics will vary depending on the component being monitored, but may contain information such as average/max times/tasks, transcation information, session counts, error counts and other important information. For more information on each of these panels view the XML file source code or click the search icon to view the raw data within Splunk.

#### Note:
The PTA Dashboard only contains application metrics (relevant threat analytics information), including severity, recent events and trends. It does not contain service status or hardware monitors.

### How Often Do The Dashboards Update?
The data is being fed into Splunk at near real-time, at one-minute intervals from the Vault and Component servers. The dashboards themselves are configured to refresh each panel query every 30 seconds. The dashboards can be configured to update on your own desired interval.

### Types of Monitors:
1. **Vault:** These are Vault Audit Action Codes generated by the CyberArk Solution. This requires the PrivateArk Server Service to be online in order to send logs.
2. **VaultMonitor:** These are the hardware stat monitors generated by the CyberArk Solution for the Vault Server(s). This requires the PrivateArk Server Service to be online in order to send logs.
3. **PTA:** These are PTA alert events generated by the CyberArk solution. This requires the PTA Service to be online in order to send these logs.
4. **ApplicationMonitor:** These are software specific monitors generated by the PowerShell Scripts for the Vault/Component Server(s). This requires the PowerShell Script/Scheduled Task to be running in order to send logs.
5. **HardwareMonitor:** These are hardware stat  monitors generated by the PowerShell Scripts for the Component Server(s). This requires the PowerShell Script/Scheduled Task to be running in order to send logs.
7. **OSMonitor:** These are OS monitors generated by the PowerShell Scripts for the Vault/Component Server(s). This requires the PowerShell Script/Scheduled Task to be running in order to send logs.
8. **SyntheticTransactionMonitor:** These are synthetic monitors generated by the PowerShell Scripts on a single Component Server that is designed to check the HTTP status code and response time of web urls (like the PVWA and it's various authentication pages). This requires the PowerShell Script/Scheduled Task to be running in order to send logs.
9. **LogonMonitorCount/LogonMonitorRecent:** These are OS level user authentication monitors generated by the PowerShell Scripts for the Vault(s). This requires the PowerShell Script/Scheduled Task to be running in order to send logs. (Coming Soon)

## Credits
Many thanks to Joe Garcia, Mark DiFilippo, Jeff Vealey, Kevin Naglich, Sean May, Chris Maroun, Noam Liran for the assistance and feedback along the way.
