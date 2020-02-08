
. "$PSScriptRoot\RefreshEnv.ps1"
. "$PSScriptRoot\NexssLog.ps1"
function ensureEnvPath {
    # Nexss is SAFE we DO NOT use administrator rights (user level)
    param
    (
        [Parameter(Mandatory = $true)] [string] $path
    )

    if (!(Test-Path $path)) {
        nxsError("$path does not exists, so it will not be added. Program has been terminated.") 
        exit
    }

    if ((Get-Item $path) -isnot [System.IO.DirectoryInfo]) {
        nxsError("$path is a file. You can only pass directories.") 
        exit
    }

    if ($($env:Path).ToLower().Contains($($path).ToLower()) -eq $true) { 
        refreshEnv
    }
    else {
        nxsInfo("Adding $path to the users PATH environment variable.") 
        [System.Environment]::SetEnvironmentVariable("Path", $path + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User"), "User") # for the user
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 
        nxsOk("$path has been added to the user environment variables.") 
        nxsWarn("You may need to restart your terminal for the changes to take effect.") 
        refreshEnv     
    }
}


