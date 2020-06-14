<?php

function nxsInfo($info)
{
  fwrite(STDERR, "NEXSS/info: ${info}");
}

function nxsOk($ok)
{
  fwrite(STDERR, "NEXSS/ok: ${ok}");
}

function nxsError($error)
{
  fwrite(STDERR, "NEXSS/error: ${error}");
}

function nxsWarn($warn)
{
  fwrite(STDERR, "NEXSS/warn: ${warn}");
}

function nxsTrace($trace)
{
  fwrite(STDERR, "NEXSS/trace: ${trace}");
}

function nxsDebug($debug)
{
  fwrite(STDERR, "NEXSS/debug: ${debug}");
}
