#!/bin/bash

# Generate the full directory name with the version number
dir_name="${dir_base}_${version}"

# Check if the directory already exists
while [ -d "/home/icebergasv/${dir_name}" ]; do
  # If it exists, increment the version number and try again
  version=$((version + 1))
  dir_name="${dir_base}_${version}"
done

# Create the new directory
mkdir "/home/icebergasv/ros-bags/swilers-testing/${dir_name}"
echo "Created directory /home/icebergasv/${dir_name}"

cd /home/icebergasv/asv-system/catkin_ws_V2

roslaunch system_startup_pkg system_startup.launch &
rosbag record  -O subset  /home/icebergasv/${dir_name}/ /mavros/battery \
/diagnostics\ \
/mavros/global_position/compass_hdg
/mavros/global_position/local
/mavros/global_position/global
/mavros/local_position/pose
/mavros/local_position/velocity
/mavros/global_position/home
/mavros/global_position/raw/fix
/mavros/global_position/raw/satellites
/mavros/global_position/set_gp_origin
/mavros/gpsstatus/gps1/raw
/mavros/gpsstatus/gps1/rtk

/prop_angle_range
/scan
/prop_xy_dist
/completed_props



