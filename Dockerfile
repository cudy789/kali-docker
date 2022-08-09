# Corey Knutson, 6/17/2022

FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# If you want to install more packages, add their apt package names to the end of the following line
RUN apt-get update && apt-get install -y vim inetutils-ping net-tools git screen usbutils

RUN apt-get update && apt-get install -y kali-linux-default

