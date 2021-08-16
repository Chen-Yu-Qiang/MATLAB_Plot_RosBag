function output = get_v_kf_mean(self)
self.v_kf_mean.topicName="kf_vmean";
self.v_kf_mean.yUnit="m/s";
self.v_kf_mean.showName="v_{kf,mean}";
self.v_kf_mean.readFromGeom_Twist(self);
output = 1;
end
