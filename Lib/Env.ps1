
function ensureEnvPath {
    # Nexss is SAFE we DO NOT use administrator rights (user level)
    param
    (
        [Parameter(Mandatory = $true)] [string] $path
    )

    if (!(Test-Path $path)) {
        [Console]::Error.WriteLine("NEXSS/error: $path does not exists, so it will not be added. Program has been terminated.") 
        exit
    }

    if ((Get-Item $path) -isnot [System.IO.DirectoryInfo]) {
        [Console]::Error.WriteLine("NEXSS/error: $path is a file. You can only pass directories.") 
        exit
    }

    if ($($env:Path).ToLower().Contains($($path).ToLower()) -eq $true) { 
        refreshEnv
    }
    else {
        [Console]::Error.WriteLine("NEXSS/info: Adding $path to the users PATH environment variable.") 
        [System.Environment]::SetEnvironmentVariable("Path", $path + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User"), "User") # for the user
        [Console]::Error.WriteLine("NEXSS/ok: $path has been added to the user environment variables.") 
        refreshEnv
        
    }
}

function refreshEnv {
    $env:Path = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User);

}
