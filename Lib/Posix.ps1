function pathWinToPosix($path, $type = "bash") {
    # bash - have /mnt/
    # mingw - don't have /mnt/
    $p = $(wsl wslpath -a "'$path'")
    if ($type -eq "bash") {
        $p = $p -replace "/mnt/", "/"
    }
    return $p
}
