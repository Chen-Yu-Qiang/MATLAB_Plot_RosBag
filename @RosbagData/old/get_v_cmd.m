function output = get_v_cmd(self)
self.v_cmd.topicName="tello/cmd_vel";
self.v_cmd.yUnit="m/s";
self.v_cmd.showName="v_{cmd}";
self.v_cmd.readFromGeom_Twist(self);
temp=self.v_cmd.x;
self.v_cmd.x=-self.v_cmd.y;
self.v_cmd.y=temp;
output = 1;
end
