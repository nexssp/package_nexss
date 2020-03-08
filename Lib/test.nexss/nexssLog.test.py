# Nexss PROGRAMMER - Blender/Python3
# Python 3.7
import json
import sys
import os
sys.path.append(os.getenv("NEXSS_PACKAGES_PATH") + "\\Nexss\\Lib\\")
from NexssIn import *

nxsInfo("Nexss info message")
nxsOk("Nexss ok message")
nxsWarn("Nexss warn message")
nxsError("Nexss error message")

NexssStdout = json.dumps(NexssStdout, ensure_ascii=False).encode('utf8','surrogateescape')
# STDOUT
print(NexssStdout.decode('utf8','surrogateescape'))
