# get various objects for a specific process using the Get-Process cmdlet in a format that Boundary can consume

# Example use: powershell .\mrprocess.ps1 [object type], [name of process], [metric name]
#
# Examples:
#
# PS C:\Users\Mark\Documents\Scripts> powershell .\mrprocess.ps1 WS powershell my.metric.name
# my.metric.name 70045696
# PS C:\Users\Mark\Documents\Scripts> powershell .\mrprocess.ps1 CPU powershell my.metric.name
# my.metric.name 3.296875
# PS C:\Users\Mark\Documents\Scripts> powershell .\mrprocess.ps1 Id powershell my.metric.name
# my.metric.name 4396
#
# powershell -NoLogo -NonInteractive -Command Set-ExecutionPolicy RemoteSigned; C:\\Users\\Administrator\\Documents\\process-metric.ps1 CPU powershell POWERSHELL_CPU

$process=$args[1]
$metric=($args[2] -Replace('\r',''))
$type=$args[0]

If($a -eq 5)
 {
   '$a equals 5'
 }

$computer = get-content env:computername

while(1) {
  $value = Get-Process $process | Select-Object $type

  # $text = $metric + ' ' + $value.$type + ' ' + $env:computername
  "WINDOWS_PROCESS_CPU $value $computer"
  Start-Sleep -s 1
}

#Add-Content  C:\Users\Administrator\Documents\process.txt $text
