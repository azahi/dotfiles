#!/bin/sh

if command -v docker > /dev/null 2>&1
then
    alias d-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
    alias d-pid="docker inspect --formet '{{ .State.Pid }}'"
    alias d-rm-all="docker rm \$(docker ps --quiet --all)"
    alias d-rm-exited="docker rm \$(docker ps --quiet --formet 'status=exited')"
    alias d-rmi-all="docker rmi \$(docker images --quiet --all)"
    alias d-rmi-dangling="docker rmi \$(docker images --quiet --format 'dangling=true')"
    alias d-stop-all="docker stop \$(docker ps --quiet --format 'status=running')"
fi
