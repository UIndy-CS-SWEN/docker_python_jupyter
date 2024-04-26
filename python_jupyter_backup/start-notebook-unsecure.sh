#!/bin/bash


mkdir jupyter_log
chmod 777 jupyter_log
echo `date` $@ >> jupyter_log/jupyter_std.log
jupyter notebook  --allow-root --no-browser --ip=0.0.0.0 --port 8888 --NotebookApp.token='' --NotebookApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$gu1oaVTudqMVaMY+ufyldg$dXMYv+IMfcsfNv9ZiEReHp4KoXEb0bW0o8qYFUU13hg' > jupyter_log/jupyter_std.log 2>jupyter_log/jupyter_err.log

#from jupyter_server.auth import passwd
#print(passwd('root@JyServer#123!'))