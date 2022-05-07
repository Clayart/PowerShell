#This script will list all scheduled tasks and their corresponding UserID, Status, and LogonType (and TaskPath if needed).
#This is especially useful for quickly looking through scheduled tasks to see if any are using user credentials to run.
$tasks = Get-ScheduledTask -TaskName *
$results = foreach ($task in $tasks) {
    [PSCustomObject]@{
        TaskName = $task.TaskName
        UserId   = $task.Principal.UserId
        Status = $task.State
        LogonType = $task.Principal.LogonType
        #TaskPath = $task.TaskPath
    }
}
$results | Sort-Object -Property 'UserId' | Format-Table
