function pathWinToPosix($path, $type = "bash") {
    # bash - have /mnt/
    # mingw - don't have /mnt/

    return ($(wsl wslpath -a "'$path'") -replace "/mnt/", "/")
}
