#!/bin/bash

if command -v docker > /dev/null 2>&1
then
    _docker_relies_on()
    {
        for container in "$@"
        do
            local state
            state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

            if [ "$state" = "false" ] || [ "$state" == "" ]
            then
                echo "$container is not running. Starting."
                $container
            fi
        done
    }

    _docker_rm()
    {
        # shellcheck disable=SC2068
        docker rm -f $@ 2>/dev/null || true
    }

    _docker_rm_all()
    {
        local containers
        mapfile -t containers < <(docker ps --all --quiet 2>/dev/null)
        docker rm "${containers[@]}" 2>/dev/null

        local volumes
        mapfile -t volumes < <(docker ps --filter status=exited --quiet 2>/dev/null)
        docker rm --volumes "${volumes[@]}" 2>/dev/null

        local images
        mapfile -t images < <(docker images --filter dangling=true --quiet 2>/dev/null)
        docker rmi "${images[@]}" 2>/dev/null
    }

    _docker_rm_stopped()
    {
        local name="$1"
        local state

        state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

        if [ "$state" = "false" ]
        then
            docker rm "$name"
        fi
    }

    unset -f _docker_relies_on
    unset -f _docker_rm
    unset -f _docker_rm_all
    unset -f _docker_rm_stopper
fi
