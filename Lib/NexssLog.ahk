nxsInfo(info)
{
  FileAppend, NEXSS/info:%info%, **
}

nxsOk(ok)
{
  FileAppend, NEXSS/ok:%ok%, **
}

nxsError(error)
{
  FileAppend, NEXSS/error:%error%, **
}

nxsWarn(warn)
{
  FileAppend, NEXSS/warn:%warn%, **
}

nxsTrace(trace)
{
  FileAppend, NEXSS/trace:%trace%, **
}

nxsDebug(debug)
{
  FileAppend, NEXSS/debug:%debug%, **
}
