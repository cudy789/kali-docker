# Corey Knutson, 6/17/2022

FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive

# If you want to install more packages, add their apt package names to the end of the following line
RUN apt-get update && apt-get install -y vim inetutils-ping net-tools git screen usbutils python3-pip python3-tk \
    ros-noetic-camera-info-manager

RUN apt-get update && apt-get install -y ros-noetic-desktop-full

# To run the tara stereo camera
RUN apt-get update && apt-get install -y libudev-dev libv4l-dev

# To get the see3cam to work, we need to copy this file here

COPY ./99-uvc.rules /etc/udev/rules.d/
RUN sudo /usr/bin/udevadm trigger

# Install some python3 libraries

RUN pip3 install scipy matplotlib opencv-python vpython signal-envelope

#CHANGE THESE VALUES
ENV ROS_HOSTNAME=localhost
ENV ROS_MASTER_URI=http://localhost:11311
