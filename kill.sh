#!/bin/bash
set -x

# -> Get docker container id using xargs // sudo docker ps | grep "engine_worker" | awk '{ print $1 }'
# -> While True:
#     -> Get stat of docker container with id sudo docker stats <container_id> | awk '{ print $4 }'
#     -> Save the result to a variable
#     -> Exit from docker stat cmd using CTRL-C or SIGINT. //Reason: docker stats runs in loop. Need to send terminate signal. 
#     -> if [ memory consumption > threshold ]
#           Gracefully shutdown the docker container. 
#     -> else:
#           Continue


CONTAINER_ID=$(sudo docker ps | grep "memleaks" | awk '{ print $1 }') 
while true 
do
    VAL=$(sudo docker stats ${CONTAINER_ID} --no-stream | awk '{ print $4 }' | tail -1 | tr -d 'MiB' | awk '{print int($1)}')
    if [ $VAL -gt 10 ]
    then
        # container name, mem consumption, time, exit code, logging. 
        sudo docker stop ${CONTAINER_ID}
        break
    fi
    sleep 5s
done
