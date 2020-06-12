# Python Log for Nexss Programmer
import sys

def nxsInfo(info):
    sys.stderr.write(f'NEXSS/info: {info}')

def nxsOk(ok):
    sys.stderr.write("NEXSS/ok: %s" % ok)

def nxsError(error):
    sys.stderr.write("NEXSS/error: %s" % error)

def nxsWarn(warn):
    sys.stderr.write("NEXSS/warn: %s" % warn) 

def nxsDebug(debug):
    sys.stderr.write("NEXSS/debug: %s" % debug) 