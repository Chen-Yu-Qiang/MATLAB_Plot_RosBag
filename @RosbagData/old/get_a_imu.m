function output = get_a_imu(self)
self.a_imu.topicName="tello/imu";
self.a_imu.yUnit="m/s^2";
self.a_imu.showName="a_{imu}";
self.a_imu.readFromSensor_Imu(self);
output = 1;
end