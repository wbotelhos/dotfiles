#!/bin/bash

### BEGIN INIT INFO
# Provides:          mongod
# Required-Start:    $network $local_fs $remote_fs
# Required-Stop:     $network $local_fs $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Should-Start:      $syslog $named
# Should-Stop:       $syslog $named
# Short-Description: mongod daemon
# Description:       mongod daemon
### END INIT INFO

CONF=/usr/local/mongodb/mongodb.yml
DAEMON=/usr/local/mongodb/bin/mongod
NAME=mongod
PID=/var/run/mongodb.pid

case "$1" in
  start)
    if [ -f $PID ]; then
      echo "${PID} exists, process is already running or crashed."
    else
      echo 'MongoDB starting...'

      $DAEMON -f $CONF
    fi
  ;;

  stop)
    if [ ! -f $PID ]; then
      echo "${PID} does not exist, process is not running."
    else
      echo 'MongoDB stopping ...'

      PID=`cat ${PID}`

      $DAEMON --shutdown

      while [ -x /proc/${PID} ]; do
        echo 'Waiting for MongoDB to shutdown...'
        sleep 1
      done

      echo 'MongoDB stopped.'
    fi
  ;;

  status)
    if [ ! -f $PID ]; then
      echo 'MongoDB is not running'
    else
      echo "MongoDB is running (`< $PID`)"
    fi
  ;;

  restart)
    $0 stop
    $0 start
  ;;

  *)
    echo "Usage: /etc/init.d/${NAME} {start|stop|restart|status}" >&2
    exit 1
  ;;
esac

exit 0
