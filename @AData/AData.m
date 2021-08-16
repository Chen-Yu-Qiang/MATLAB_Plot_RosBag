classdef AData < handle
   properties (SetAccess = public)
      x=[];
      y=[];
      z=[];
      th=[];
      t=[];
      xUnit="s";
      xlabel="Time"
      yUnit="m"
      yUnitAng="deg"
      showName="";
      topicName="vel_cmd";
      fileName="";
      t0=0;
      ang=0;
      offset_Marker=[0,0,0];
      plotMarker=".";
   end
   methods
      output = readFromGeom_Twist(obj,father)
      output = readFromNav_Odom(obj,father)
      output = readFromNav_Odom_pos(obj,father)
      output = readFromSensor_Imu(obj,father)
      output = readFromGeom_PoseStamped(obj,father)
      output = readFromGeom_Point(obj,father)
      output = readFromFloat32(obj,father)
      output = readFromStatus(obj,father)
      output = sat(obj,limp,limn)
   end
end
