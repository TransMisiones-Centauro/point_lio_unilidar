FROM osrf/ros:noetic-desktop-full

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y git \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /catkin_ws/src/

RUN cd /catkin_ws/src/ && git clone https://github.com/unitreerobotics/unilidar_sdk.git

RUN cd /catkin_ws/src/ && git clone https://github.com/TransMisiones-Centauro/point_lio_unilidar.git

RUN rm -fr /catkin_ws/src/unilidar_sdk/unitree_lidar_ros2/src/unitree_lidar_ros2

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
 && apt-get update \
 && rosdep install -r -y \
     --from-paths /catkin_ws/src \
     --ignore-src \
 && rm -rf /var/lib/apt/lists/*

RUN . /opt/ros/$ROS_DISTRO/setup.sh \
 && cd /catkin_ws \
 && catkin_make
 
 RUN sed --in-place --expression \
      '$isource "/catkin_ws/devel/setup.bash"' \
      /ros_entrypoint.sh
