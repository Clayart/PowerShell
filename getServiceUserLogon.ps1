#This script returns the DisplayName, StartName, and State of all Windows services. 
$ComputerName = $env:computername
Get-WmiObject -Class Win32_Service -ComputerName $ComputerName | `
Sort-Object -Property StartName | `
Select-Object DisplayName, StartName, State
