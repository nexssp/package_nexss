# Nexss PROGRAMMER 2.0 - One.ps1
$nxsParameters = @()
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

# Add value to data

$NexssStdout | Add-Member -Force -NotePropertyMembers  @{sequence = "one" }

$NexssStdout.PSObject.Properties.Remove($resultField_1)

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"
