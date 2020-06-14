<?php

// Get environment variable
function genv($name, $default = null)
{
    if ($r = @filter_var($_SERVER[$name])) {
        return $r;
    }

    return $default;
}
