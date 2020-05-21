#!/bin/bash

# -> Get docker container id using xargs // sudo docker ps | grep "engine_worker" | awk '{ print $1 }'
# -> While True:
#     -> Get stat of docker container with id sudo docker stats <container_id> | awk '{ print $4 }'
#     -> Save the result to a variable
#     -> Exit from docker stat cmd using CTRL-C or SIGINT. //Reason: docker stats runs in loop. Need to send terminate signal. 
#     -> if [ memory consumption > threshold ]
#           Gracefully shutdown the docker container. 
#     -> else:
#           Continue


container_id=$(sudo docker ps | grep "memleaks" | awk '{ print $1 }')
while true 
do
    `sudo docker stats ${container_id} | awk '{ print $4 }'` >  temp.txt
     break
done
