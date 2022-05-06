#This script returns all Active Directory computers that have logged in within the last 30 days.
$getADComputers = Get-ADComputer -Filter * -Properties *
$todaysDate = Get-Date

$activeComputersList = foreach ($computer in $getADComputers)
{
    if($computer.LastLogonDate -gt $todaysDate.AddDays(-30))
    {
        $computer | Select Name, LastLogonDate
    }
}

$activeComputersList | Sort Name
