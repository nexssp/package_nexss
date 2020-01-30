# Nexss PROGRAMMER 2.0.0 - PowerShell
# Default template for JSON Data
# STDIN
[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
[Console]::InputEncoding = [Text.UTF8Encoding]::UTF8

$NexssStdin = $input
$NexssStdout = $NexssStdin | ConvertFrom-Json

# Write-Error "error from ps1" # With Stack Trace

[Console]::Error.WriteLine("Error from Powershell")

[Console]::Error.WriteLine("NEXSS/warn:Warning from Powershell")

$NexssStdout | Add-Member -Force -NotePropertyMembers  @{test = "test" }
# STDOUT
Write-Host 	(ConvertTo-Json -Compress $NexssStdout)
