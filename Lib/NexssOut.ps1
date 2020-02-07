# Nexss Programmer Pro 2.1

function nxsOutClean {
    process { $NexssStdout.PSObject.Properties.Remove($_) }
}

if ($nxsParameters) {
    $nxsParameters | nxsOutClean
}

@("nxsOutAs", "nxsInAs", "debug", "nxsIn") | nxsOutClean

Write-Host 	(ConvertTo-Json -Compress $NexssStdout)

