<?php
# Nexss PROGRAMMER 2.0.0 - PHP
# Default template for JSON Data
# STDIN
$NexssStdin = fgets(STDIN);
$parsedJson = json_decode($NexssStdin,true);

fwrite(STDERR, "NEXSS/ok:OK Nexss message FROM PHP" . PHP_EOL );

# Modify Data
$parsedJson["test"] = "test";
// $parsedJson["test"] = "test";
$NexssStdout = json_encode($parsedJson, JSON_UNESCAPED_UNICODE);


fwrite(STDERR, 'Error FROM PHP');

# STDOUT
fwrite(STDOUT, $NexssStdout);
