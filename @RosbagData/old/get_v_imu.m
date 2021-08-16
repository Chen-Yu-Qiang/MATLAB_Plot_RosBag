function output = get_v_imu(self)
self.v_imu.topicName="tello/odom";
self.v_imu.yUnit="m/s";
self.v_imu.showName="v_{imu}";
self.v_imu.readFromNav_Odom(self);
output = 1;
end