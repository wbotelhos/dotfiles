#!/bin/bash

### BEGIN INIT INFO
# Provides:          redis-server
# Required-Start:    $network $local_fs $remote_fs
# Required-Stop:     $network $local_fs $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Should-Start:      $syslog $named
# Should-Stop:       $syslog $named
# Short-Description: redis daemon
# Description:       redis daemon
### END INIT INFO

CLI=/usr/local/redis/src/redis-cli
CONF=/usr/local/redis/redis.conf
EXEC=/usr/local/redis/src/redis-server
NAME=redis-server
PID=/var/run/redis.pid
PORT=6379

case "$1" in
  start)
    if [ -f $PID ]; then
      echo "${PID} exists, process is already running or crashed."
    else
      echo 'Redis starting...'

      $EXEC $CONF
    fi
  ;;

  stop)
    if [ ! -f $PID ]; then
      echo "${PID} does not exist, process is not running."
    else
      echo 'Redis stopping ...'

      PID=`cat ${PID}`

      $CLI -p $PORT shutdown

      while [ -x /proc/${PID} ]; do
        echo 'Waiting for Redis to shutdown...'
        sleep 1
      done

      echo 'Redis stopped.'
    fi
  ;;

  status)
    if [ ! -f $PID ]; then
      echo 'Redis is not running'
    else
      echo "Redis is running (`< $PID`)"
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
