#!/bin/bash

exe=graphql.serve
pid=$(ps -ef|grep $exe|grep -v "grep $exe"|grep -v "ctl_${exe}.sh"|awk '{print $2}')

case $1 in
	start)
        if [[ "$pid" != "" ]]; then
                echo "the exe $exe is run, pid-$pid"
                exit
        fi
                nohup ./$exe	>/tmp/${exe}_demon.log 2>&1 &
        ;;
	stop)
        if [[ "$pid" == "" ]]; then
                echo "the exe $exe is already stop"
                exit
        fi

        kill $pid
		;;
	restart|force-reload)
		$0 stop
		sleep 1
		$0 start
		;;

    status)

        if [[ "$pid" == "" ]]; then
                echo "the exe $exe is stop"
        else
                echo "the exe $exe is run, pid-$pid"
        fi

        exit
        ;;
	ping)
		curl --connect-timeout 2 -m 2 'http://127.0.0.1/test'
		echo ""		
	    ;;
	*)
        echo "Usage: $0 {start|stop|restart|force-reload|status|ping}"
        exit 1
        ;;
esac

