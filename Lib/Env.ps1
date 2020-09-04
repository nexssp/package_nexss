
. "$PSScriptRoot\RefreshEnv.ps1"
. "$PSScriptRoot\NexssLog.ps1"
function ensureEnvPath {
    # Nexss is SAFE we DO NOT use administrator rights (user level)
    param
    (
        [Parameter(Mandatory = $true)] [string] $pathToAdd
    )

    if (!(Test-Path $pathToAdd)) {
        nxsError("$pathToAdd does not exists, so it will not be added. Program has been terminated.") 
        exit
    }

    if ((Get-Item $pathToAdd) -isnot [System.IO.DirectoryInfo]) {
        nxsError("$pathToAdd is a file. You can only pass directories.") 
        exit
    }

    if ($IsWindows) {
        if ($([System.Environment]::GetEnvironmentVariable("Path", "User") ).ToLower().Contains($($pathToAdd).ToLower()) -eq $true) { 
            nxsOk("$pathToAdd is already added in your system configuration. If you experiencing issues please restart your terminal.") 
            refreshEnv
        }
        else {
            nxsInfo("Adding $pathToAdd to the users PATH environment variable.") 
            [System.Environment]::SetEnvironmentVariable("Path", $pathToAdd + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User"), "User") # for the user
            $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 
            nxsOk("$pathToAdd has been added to the user environment variables.") 
            nxsWarn("You may need to restart your terminal for the changes to take effect.") 
            refreshEnv     
        }
    }
    elseif ($IsMacOS) { 
        if (Test-Path "~/.bash_profile") {          
            $exists = Select-String -Path "~/.bash_profile" -Pattern $pathToAdd
            if ($exists -eq $null) {
                nxsInfo("Adding path $($pathToAdd) to the environment: ~/.bash_profile")
                $env:Path += ";${pathToAdd}"
                # nxsOk("export PATH=`"${pathToAdd}:`$PATH`"")
                echo "export PATH=`"${pathToAdd}:`$PATH`"" > ~/.bash_profile
            }
            else {
                nxsInfo("$pathToAdd already exists in the /.bash_profile")
            }
        }
        else {
            nxsInfo("Adding path $($pathToAdd) to the environment")
            $env:Path += ";${pathToAdd}"      
            echo "export PATH=`"${pathToAdd}:`$PATH`"" >> ~/.bash_profile
        }
    }
    else {
        # Linux
        if (Test-Path "~/.bashrc") {          
            $exists = Select-String -Path "~/.bashrc" -Pattern $pathToAdd
            if ($exists -eq $null) {
                nxsInfo("Adding path $($pathToAdd) to the environment ~/.bashrc")
                $env:Path += ";$pathToAdd"
                echo "export PATH=`"${pathToAdd}:`$PATH`"" > ~/.bashrc
            }
            else {
                nxsInfo("$pathToAdd already exists in the /.bashrc")
            }
        }
        else {
            nxsInfo("Adding path $($pathToAdd) to the environment ~/.bashrc")
            $env:Path += ";${pathToAdd}"      
            echo "export PATH=`"${pathToAdd}:`$PATH`"" >> ~/.bashrc
        }
    }
}


