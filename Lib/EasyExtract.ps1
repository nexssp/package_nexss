# Set-Alias sz "$env:ProgramFiles\7-Zip\7z.exe"
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssLog.ps1"

function sz() {
    if (!(Get-Command 7z -errorAction SilentlyContinue)) { 
        scoop install 7zip
    }
    # nxsInfo("Unpacking archive with 7z . Please wait..")
    # break
    7z @args *>$null
}

function ur() {
    if (!(Get-Command unrar -errorAction SilentlyContinue)) { 
        scoop install winrar
    }
    
    unrar @args
}

function tarrr() {
    if (!(Get-Command tar -errorAction SilentlyContinue)) { 
        scoop install tar
    }
}


# Function: Easy-Extract
function EasyExtract {
    [CmdletBinding()]
    param (       
        [Parameter()]
        # [ValidateScript( { Test-Path -Path $_ })]
        [ValidateNotNullOrEmpty()]
        [string]$Path,

        [Parameter()]
        [Alias('Destination')]
        [ValidateNotNullOrEmpty()]
        [string]$DestinationPath = "*"
    )

    if (!$Path) {
        nxsError("You need to pass archived file to unpack.")
        break;
    }

    if (!(Test-Path $Path)) {
        nxsError("File not found $Path")
        exit;
    }
    
    $Item = Get-Item -Path $Path

    if (!(Test-Path $Item)) {
        nxsError("File not found $item")
        exit;
    }

    $Argum = @("x", $Path, "-o$DestinationPath", "-aoa", "-y")

    $Extension = $Item.Extension
    switch ($Extension) {
        ".7z" { sz $Argum }
        ".bz2" { sz $Argum }
        ".gz" { tarrr ; mkdir -p $DestinationPath *>$null ; tar xvzf $Path -C $DestinationPath --strip-components 1 *>$null }
        ".tar" { sz $Argum }
        ".tbz2" { sz $Argum }
        ".tgz" { sz $Argum }
        ".rar" { ur x $Item }
        ".zip" { Expand-Archive -Force -LiteralPath $Path -DestinationPath $DestinationPath }
        ".Z" { sz $Argum }
        #{sz x $Item -so | sz x -aoa -si -ttar -o*}
        Default {
            throw "Extension '$Extension' is not handled."
        }
    }
}

Set-Alias extract EasyExtract