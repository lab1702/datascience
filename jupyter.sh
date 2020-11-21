#!/usr/bin/with-contenv bash
## load /etc/environment vars first:
for line in $( cat /etc/environment ) ; do export $line > /dev/null; done
exec su -l rstudio -c "jupyter notebook --no-browser --ip 0.0.0.0 --port 8888 --NotebookApp.token=''"
