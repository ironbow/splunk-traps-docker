#!/bin/sh
snmptrapd -Lf /var/log/snmp-trap
tail -f /dev/null
