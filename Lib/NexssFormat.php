<?php

namespace Nexss;

class Format
{
    function Bytes($b, $p = null)
    {
        if ($b < 1024) {
            return $b . ' B';
        }
        $units = array("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB");
        $c = 0;
        if (!$p && $p !== 0) {
            foreach ($units as $k => $u) {
                if (($b / pow(1024, $k)) >= 1) {
                    $r["bytes"] = $b / pow(1024, $k);
                    $r["units"] = $u;
                    $c++;
                }
            }
            return number_format($r["bytes"], 2) . " " . $r["units"];
        } else {
            return number_format($b / pow(1024, $p)) . " " . $units[$p];
        }
    }
}
