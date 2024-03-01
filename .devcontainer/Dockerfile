ARG VARIANT=ubuntu-22.04
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive

# mount the current folder to the workspace
VOLUME /home/vscode/workspace

# install locales for UTF-8 support
RUN apt-get update && apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# set locale environment variables
ENV LANG=en_US.UTF-8

# add ROS2 repository
RUN apt-get update && \
    apt-get install -y software-properties-common curl git && \
    add-apt-repository universe && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# install ROS2
RUN apt-get update && \
    apt-get install -y ros-humble-desktop

# install ROS2 development tools
RUN apt-get -y install python3-pip python3-colcon-common-extensions

# install ROS2 tracing
RUN apt-get install -y lttng-tools liblttng-ust-dev && \
    apt-get install -y python3-babeltrace python3-lttng && \
    apt-get install -y lttng-modules-dkms

# set up user for tracing
RUN groupadd -f -r tracing && \
    usermod -a -G tracing vscode

WORKDIR /home/vscode/workspace

# download ROS2 tracing
RUN cd /home/vscode && \
    mkdir -p /home/vscode/ros2_tracing_ws/src && \
    git clone -b humble https://gitlab.com/ros-tracing/ros2_tracing.git /home/vscode/ros2_tracing_ws/src/

# build ROS2 tracing
RUN cd /home/vscode/ros2_tracing_ws &&\
    . /opt/ros/humble/setup.sh &&\
    colcon build --symlink-install --allow-overriding tracetools

USER vscode

# source ROS2 setup file
RUN echo '. /opt/ros/humble/setup.sh' >> /home/vscode/.bashrc

# source ROS2 tracing setup file
RUN echo '. /home/vscode/ros2_tracing_ws/install/setup.sh' >> /home/vscode/.bashrc

SHELL ["/bin/bash", "-c"]