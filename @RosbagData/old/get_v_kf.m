function output = get_v_kf(self)
self.v_kf.topicName="v_kf";
self.v_kf.yUnit="m/s";
self.v_kf.showName="v_{kf}";
self.v_kf.readFromGeom_Twist(self);
output = 1;
end