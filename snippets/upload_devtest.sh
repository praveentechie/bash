function deploy()
{
        WAR=$1
        HOST=$2
        CONTAINER=$3
        PORT=22
        USER="rguest"
        if [[ "$4" != "" ]]
        then
                PORT="$4"
        fi
        if [[ "$PORT" == "7022" ]]
        then
                USER="vagrant"
        fi
        echo "'Deploying war to ${HOST} with user ${USER}'"
        scp -P $PORT $WAR ${USER}@${HOST}:~/
        ssh -p $PORT $USER@$HOST "cat $WAR | sudo docker exec -i $CONTAINER sh -c 'cat  > /opt/${WAR}'"
        sleep 20s
        ssh -p $PORT $USER@$HOST "sudo docker stop $CONTAINER; sleep 5s; sudo docker start $CONTAINER;"
        ssh -p $PORT $USER@$HOST "rm -f $WAR"
}