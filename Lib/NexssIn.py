# NexssIn for Nexss Programmer
import sys
import json
import os
sys.path.append(os.getenv("NEXSS_PACKAGES_PATH") + "\\Nexss\\Lib\\")

from NexssLog import nxsInfo, nxsOk, nxsWarn, nxsError

NexssStdin = sys.stdin.read()
NexssStdout = json.loads(NexssStdin)
