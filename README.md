# PAS-APM-Dashboard-Package-for-Splunk

CyberArk Privileged Access Security Application Performance Monitoring (APM) Dashboard Package for Splunk. The PAS APM dashboards are designed to show critical monitoring information for the CyberArk PAS application, including hardware (CPU/memory/disk) and software (service status, application statistics) information for Vault, CPM, PVWA, PSM and PTA.

**_Under Development_**

**Vault Server(s) Configuration Steps:**
1. Copy PAS-APM-Vault.ps1 to Vault Server(s)
2. Configure PAS-APM-Vault.ps1 to run as a scheduled task that runs every minute, indefinetly
3. Create non-standard firewall rule to allow outbound UDP traffic for the powershell script to send SYSLOG traffic out ONLY to the SIEM server
3.1. Modify the PAS-APM-Vault.ps1 to use whatever SIEM server/port information is appropriate for your configuraiton
4. Run the scheduled task and vadlidate that Splunk is receving the syslogs
5. If not already done, enable "Vault Monitor" syslog messages to be sent from your Vault Server(s)

**Component Server(s) Configuration Steps:**
1. Copy PAS-APM-Components.ps1 to the Component Server(s)
2. Configure the PAS-APM-Components.ps1 to run as a scheduled task that runs every minute, indefinetly 
3. Modify the PAS-APM-Components.ps1 to only monitor for the required services on that component server (e.g. remove PSM relevant monitors for non-PSM servers, etc)
4. Run the scheduled task and validate that Splunk is receiving the syslogs

**Splunk Configuration Steps:**
1. Validate that Splunk is receiving the syslog messages from all the Vaults/Components
2. Once you have validated Splunk is reciving the messages, for you will need to define the Field names for the values in the syslog messages
2.1. For the PowerShell-based messages, create custom Fields based on the following names/format: "DateTime, HostName, ServiceName, ServiceStatus, ServiceStatusNumeric, ServiceStatusNumeric2"
2.2. For the VaultMonitor messages, create custom Fields based on the following names/format: Format|Vendor|Product|Version|AverageExecutionTime|MaxExecutionTime|AverageQueueTime|MaxQueueTime|NumberOfParalleTasks|MaxParallelTasks|TransactionCount|CPUUsage|MemoryUsage|DriveFreeSpaceInGB|DriveTotalSpaceInGB
3. Click on "Dashboards" in Splunk
4. Click on "Create New Dashboard"
5. Enter the following title for each Dashboard:
5.1. CyberArk Performance Monitoring Dashboard: VAULT
5.2. CyberArk Performance Monitoring Dashboard: PVWA
5.3. CyberArk Performance Monitoring Dashboard: CPM
5.4. CyberArk Performance Monitoring Dashboard: PSM
5.5. CyberArk Performance Monitoring Dashboard: PVWA
6. Click "Create Dashboard"
7. Click the "Source' button in the top left hand corner of the dashboard to modify the source code
8. Copy the source code from the corresponding .XML file and override all of the existing dashboard code
9. Click "Save" in the top right hand corner

**How do I use these dashboards?**
These dashboards are designed to provide meaningful application performance monitoring information for the CyberArk PAS solution. Dashboards are broken up into three sections, (1) Service Status, (2) Hardware Performance Monitors, and (3) Applicaiton Performance Metrics. Each of these dashboards and the data they contain are unique to the component of the CyberArk PAS solution they're designed to monitor.
(1) Service Status: The service status panels will provide information on the key services related to that component, including a color indiciator to determine whether the service is up or down quickly and the current service status.
(2) Hardware Performance Monitors: The hardware performance monitor panels show CPU Usage %, Memory Usage % and Disk Space Usage over a period of time and the current level. It too includes a color incidator to detmeine whether there is an immedaite issue that requires attention.
(3) Application Performance Metrics: The application performance metrics will vary depending on the component being monitored, but may contain information such as average/max times/tasks, transcation information, session counts, error counts and other important information. For more information on each of these panels view the XML file source code or click the search icon to view the raw data within Splunk.

**How often do the dashboards update?**
The data is being fed into Splunk at near real-time, at one-minute intervals from the Vault and Component servers. The dashboards themselves are configured to refresh each panel query every 30 seconds.

**Vault Dashboard:**
![Vault Dashboard](/Screenshots/PAS-APM-Vault-Screenshot.PNG)

**CPM Dashboard:**
![CPM Dashboard](/Screenshots/PAS-APM-CPM-Screenshot.PNG)

**PSM Dashboard:**
![PSM Dashboard](/Screenshots/PAS-APM-PSM-Screenshot.PNG)

**PVWA Dashboard:**
![PVWA Dashboard](/Screenshots/PAS-APM-PVWA-Screenshot.PNG)

**Note**
1. If you're having issues with timestamps in Splunk being zulu time but are being viewed as though they are in your local time, change the "UseLegacySyslogFormat" to Yes for the Splunk configuraiton in your dbparm.ini file on the Vault server(s).
