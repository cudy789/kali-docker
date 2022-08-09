#!/bin/bash

# Corey Knutson, 12/2/2021


docker run --rm -h kali-docker --add-host kali-docker:127.0.0.1 --network host -it \
  --user=$(id -u $USER):$(id -g $USER) \
  --env="DISPLAY" \
  --workdir="/home/$USER" \
  --volume="/home/$USER:/home/$USER" \
  --volume="/etc/group:/etc/group:ro" \
  --volume="/etc/passwd:/etc/passwd:ro" \
  --volume="/etc/shadow:/etc/shadow:ro" \
  --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
  --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
  --workdir=$(pwd) \
  --privileged \
  rogueraptor7/kali:latest /bin/bash
