Set-Alias sz "$env:ProgramFiles\7-Zip\7z.exe"
Set-Alias ur "$env:ProgramFiles\WinRAR\UnRAR.exe"

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
    
    $Item = Get-Item -Path $Path

    if (!(Test-Path $Item)) {
        Write-Error "NEXSS/error:File not found $item"
        exit;
    }

    $Argum = @("x", $Path, "-o$DestinationPath", "-aoa", "-y")

    $Extension = $Item.Extension
    switch ($Extension) {
        ".7z" { sz $Argum }
        ".bz2" { sz $Argum }
        ".gz" { sz $Argum }
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