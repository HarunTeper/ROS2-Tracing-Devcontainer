# Clone and build the ROS2 tracing workspace
cd /home/vscode/workspace
mkdir -p ros2_tracing_ws/src
git clone -b humble https://gitlab.com/ros-tracing/ros2_tracing.git /home/vscode/workspace/ros2_tracing_ws/src/
cd /home/vscode/workspace/ros2_tracing_ws
. /opt/ros/humble/setup.sh
colcon build --symlink-install --allow-overriding tracetools

# Add the workspace to the bashrc
echo 'source /home/vscode/workspace/ros2_tracing_ws/install/setup.bash' >> /home/vscode/.bashrc