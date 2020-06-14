<?php

function nxsInfo($info)
{
  if (is_array($info)) $info = var_export($info, true);
  fwrite(STDERR, "NEXSS/info: ${info}");
}

function nxsOk($ok)
{
  if (is_array($ok)) $ok = var_export($ok, true);
  fwrite(STDERR, "NEXSS/ok: ${ok}");
}

function nxsError($error)
{
  if (is_array($error)) $error = var_export($error, true);
  fwrite(STDERR, "NEXSS/error: ${error}");
}

function nxsWarn($warn)
{
  if (is_array($warn)) $warn = var_export($warn, true);
  fwrite(STDERR, "NEXSS/warn: ${warn}");
}

function nxsTrace($trace)
{
  if (is_array($trace)) $trace = var_export($trace, true);
  fwrite(STDERR, "NEXSS/trace: ${trace}");
}

function nxsDebug($debug)
{
  $debugInfo  = var_export($debug, true);
  fwrite(STDERR, "NEXSS/debug: DEBUG INFO " .  $debugInfo);
}
