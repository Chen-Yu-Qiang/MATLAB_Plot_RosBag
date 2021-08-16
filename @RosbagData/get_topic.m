function adataObj = get_topic(self,msgType,msgName)
    if msgType=="Control_PidState"
        adataObj=PIDData();
        adataObj.topicName=msgName;
        adataObj.readFromControl_PidState(self);
    end
    if msgType=="Geom_Twist12"
        adataObj=AData();
        adataObj.topicName=msgName;
        adataObj.ang=12;
        adataObj.readFromGeom_Twist(self);
    end
    if msgType=="Geom_Twist"
        adataObj=AData();
        adataObj.topicName=msgName;
        adataObj.readFromGeom_Twist(self);
    end
    if msgType=="Geom_Point"
        adataObj=AData();
        adataObj.topicName=msgName;
        adataObj.readFromGeom_Point(self);
    end
    if msgType=="Float32"
        adataObj=AData();
        adataObj.topicName=msgName;
        adataObj.readFromFloat32(self);
    end
end
