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
# powershell -NoLogo -NonInteractive -Command Set-ExecutionPolicy RemoteSigned; C:\\Users\\Administrator\\Documents\\process-metric.ps1 powershell POWERSHELL_CPU

$process_name=$args[0]
$cpu_enabled=$args[1]
$vm_enabled=$args[2]
$pm_enabled=$args[3]
$poll=$args[4]

# Get the name of the computer we are running on
$computer = get-content env:computername

# Loop collecting metrics
while(1) {
  $process = Get-Process $process_name

  if ($cpu_enabled -eq "true") {
    $cpu = $process | Select-Object CPU
    $text = 'WINDOWS_PROCESS_CPU' + ' ' + $cpu."CPU" + ' ' + $computer
    echo $text
  }

  if ($vm_enabled -eq "true") {
    $vm = $process | Select-Object VM
    $text = 'WINDOWS_PROCESS_VIRTUAL_MEMORY' + ' ' + $vm."VM" + ' ' + $computer
    echo $text
  }

  if ($pm_enabled -eq "true") {
    $pm = $process | Select-Object PM
    $text = 'WINDOWS_PROCESS_CPU_PAGED_MEMORY' + ' ' + $pm."PM" + ' ' + $computer
    echo $text
  }

  Start-Sleep -s $poll
}

