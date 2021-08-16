function output = get_p_imu(self)
self.p_imu.topicName="from_IMU";
self.p_imu.showName="p_{imu}";
self.p_imu.readFromGeom_PoseStamped(self);
output = 1;
for i=1:length(self.p_imu.x)
    self.p_imu.x(i)=self.p_imu.x(i)+self.offset_IMU(1);
    self.p_imu.y(i)=self.p_imu.y(i)+self.offset_IMU(2);
    self.p_imu.z(i)=self.p_imu.z(i)+self.offset_IMU(3);
    
end
end
