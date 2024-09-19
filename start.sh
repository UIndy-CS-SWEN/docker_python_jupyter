#!/bin/bash

sudo mkdir /var/log/jupyter

CMD="$@"
echo $CMD > /var/log/jupyter/jupyter_log.log
$CMD

