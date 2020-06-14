#Warn
SendMode Input
SetWorkingDir %A_ScriptDir% 

(oHTML:=ComObjCreate("HTMLFile")).write("<!DOCTYPE html><html><head><meta http-equiv=""X-UA-Compatible"" content=""IE=edge""><meta charset=""utf-8"" /></head><body></body></html>")

; STDIN
STDIN := FileOpen("*", "r")
STDERR:= FileOpen("**", "w")

NexssStdin := STDIN.Read()
NexssStdout := oHTML.parentWindow.JSON.parse(NexssStdin)

; TODO: better handle of exists object property
nxsOutAs := "nxsOut"
try nxsOutAs:=NexssStdout.nxsOutAs
catch e

if (nxsOutAs) {
    NexssStdout.resultField_1 := nxsOutAs
}

NexssStdout.resultField_1 := nxsOutAs