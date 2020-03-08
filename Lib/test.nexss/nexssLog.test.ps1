$nxsParameters = @("")
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

$ErrorActionPreference = "Stop"

nxsInfo("Nexss info message")
nxsOk("Nexss ok message")
nxsWarn("Nexss warn message")
nxsError("Nexss error message")

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"