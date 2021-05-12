#!/bin/sh

if command -v docker >/dev/null 2>&1; then
	alias dk="docker"
	alias dk-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
	alias dk-pid="docker inspect --format '{{ .State.Pid }}'"
	alias dk-rm-all="docker rm \$(docker ps --quiet --all)"
	alias dk-rm-exited="docker rm \$(docker ps --quiet --format 'status=exited')"
	alias dk-rmi-all="docker rmi \$(docker images --quiet --all)"
	alias dk-rmi-dangling="docker rmi \$(docker images --quiet --format 'dangling=true')"
	alias dk-stop-all="docker stop \$(docker ps --quiet --format 'status=running')"
fi
