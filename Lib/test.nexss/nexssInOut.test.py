# Nexss PROGRAMMER - Blender/Python3
# Python 3.7
import json
import sys
import os
sys.path.append(os.getenv("NEXSS_PACKAGES_PATH") + "\\Nexss\\Lib\\")
from NexssIn import *

NexssStdout['testInOut'] = "Yes"

NexssStdout[NexssStdout['resultField_1']] = "Some custom output"

# STDOUT
NexssStdout = json.dumps(NexssStdout, ensure_ascii=False).encode('utf8', 'surrogateescape')
print(NexssStdout.decode('utf8','surrogateescape'))
