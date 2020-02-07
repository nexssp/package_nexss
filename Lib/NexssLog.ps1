
function nxsInfo($info) {
    [Console]::Error.WriteLine("NEXSS/info:$info")
}

function nxsOk($ok) {
    [Console]::Error.WriteLine("NEXSS/ok:$ok")
}

function nxsError($error) {
    [Console]::Error.WriteLine("NEXSS/error:$error")
}

function nxsWarn($warn) {
    [Console]::Error.WriteLine("NEXSS/warn:$warn")
}