function output = get_p_pad(self)
self.p_pad.topicName="from_box_merge";
self.p_pad.showName="p_{pad}";
self.p_pad.ang=12;
self.p_pad.readFromGeom_Twist(self);
output = 1;
for i=1:length(self.p_pad.x)
    if abs(self.p_pad.x(i))>10 ||abs(self.p_pad.y(i))>10||abs(self.p_pad.z(i))>10 
        self.p_pad.x(i)=NaN;
        self.p_pad.y(i)=NaN;
        self.p_pad.z(i)=NaN;
    end
end
end
