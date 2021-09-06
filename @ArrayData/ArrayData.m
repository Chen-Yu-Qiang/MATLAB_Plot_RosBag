classdef ArrayData < handle
   properties (SetAccess = public)
      Data=[];

      t=[];
      xUnit="s";
      xlabel="Time"
      yUnit="m"
      yUnitAng="deg"
      showName="";
      topicName="x_pid";
      fileName="";
      t0=0;
      ang=0;
      offset_Marker=[0,0,0];
      plotMarker=".";
   end
   methods
      output = readFromFloat32Array(obj,father)
   end
end
