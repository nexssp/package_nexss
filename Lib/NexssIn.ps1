# Nexss Programmer Pro 2.1

[Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
[Console]::InputEncoding = [Text.UTF8Encoding]::UTF8

$NexssStdout = $input | ConvertFrom-Json

# Result field for this module is "files"
$inField_1 = "nxsIn"
if ($NexssStdout.nxsInAs) {
    $inField_1 = $NexssStdout.nxsInAs
}

# No parameters added so we take Output from previous module
if (!$NexssStdout.$inField_1 -and $NexssStdout.nxsOut) {
    $inField_1 = "nxsOut"
}

# If there is no files param, we check if there are standard parameters
if (($inFieldValue_1.count -eq 0) -and $NexssStdout._.count -gt 0) {
    $NexssStdout | Add-Member -Force -NotePropertyMembers  @{"$inField_1" = $NexssStdout._ }
}

$inFieldValue_1 = $NexssStdout.$inField_1

# Out result name fields
$resultField_1 = "nxsOut"
if ($NexssStdout.nxsOutAs) {
    $resultField_1 = $NexssStdout.nxsOutAs
}

. "$PSScriptRoot\NexssLog.ps1"