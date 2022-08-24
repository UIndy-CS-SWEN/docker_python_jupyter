#!/bin/bash

mkdir jupyter_log
chmod 777 jupyter_log
echo `date` $@ >> jupyter_log/jupyter_std.log
jupyter notebook  --allow-root --no-browser --ip=0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password='' > jupyter_log/jupyter_std.log 2>jupyter_log/jupyter_err.log

