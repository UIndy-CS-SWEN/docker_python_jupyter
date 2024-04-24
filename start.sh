#!/bin/bash

CMD="$@"
echo $CMD > /var/log/jupyter_log.log
$CMD

