# ROS2-Tracing-Devcontainer

## Setup

Install [Docker Engine](https://docs.docker.com/engine/install/)

Install [Visual Studio Code](https://code.visualstudio.com/)

## Start the Container with Visual Studio Code

In Visual Studio Code, install the **Docker** and **Dev Containers** extensions.

Build and open the container.

## Start the Container with Docker

Run the following command in a terminal that is in the current folder's directory:

> docker build -t ros2_tracing .devcontainer/

Start the container using the following command:

> docker run --network host -it -v .:/home/vscode/workspace ros2_tracing

## Tracing

The trace tools are already set up. Execute the run_tracing.sh script to start tracing. You can specify a command line argument to set the folder name of the trace in the traces folder.

>./run_tracing.sh session_name