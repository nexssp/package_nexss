# NexssIn for Nexss Programmer
import sys
import json
import os
sys.path.append(os.getenv("NEXSS_PACKAGES_PATH") + "\\Nexss\\Lib\\")

from NexssLog import nxsInfo, nxsOk, nxsWarn, nxsError

NexssStdin = sys.stdin.read()
NexssStdout = json.loads(NexssStdin)

# We check if there is attribute 'nxsInAs' - this will get different default attrinute IN
try:
    inField_1 = NexssStdout['nxsInAs']
except KeyError:
    inField_1 = "nxsIn"

# No parameters added so we take Output from previous module - intuitive workflow
if not hasattr(NexssStdout, 'inField_1') and hasattr(NexssStdout, 'nxsOut'):
    inField_1 = "nxsOut"

# We get value of the IN attribute
try:
    Field_Value_1 = NexssStdout[inField_1]
except KeyError:
    Field_Value_1 = None

if Field_Value_1 is None:
    try:
        Field_Value_1 = NexssStdout['_'].copy()       
    except KeyError:        
        Field_Value_1 = None

# We got IN value inside Field_Value_1 so we delete _ var
if hasattr(NexssStdout, '_'):
    del NexssStdout['_']

# Result field name to pass to next module
try:
    NexssStdout['resultField_1'] = NexssStdout['nxsOutAs']
except KeyError:
    NexssStdout['resultField_1'] = "nxsOut"

if Field_Value_1:
    NexssStdout['nxsIn'] = Field_Value_1
