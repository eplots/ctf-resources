<?php
function getUserIp()
{
    return $_SERVER['REMOTE_ADDR'];
}

function runTest($test, $ip_address)
{
    if ($test === 'ping')
    {
        system("ping -c4 ${ip_address}");
    }
    if ($test === 'traceroute')
    {
        system("traceroute ${ip_address}");
    }
}

?>
