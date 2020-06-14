NexssStdout := oHTML.parentWindow.JSON.stringify(NexssStdout)
STDOUT := FileOpen("*", "w")
STDOUT.Write(NexssStdout)