classdef PIDData < handle
   properties (SetAccess = public)
      kp=[];
      ki=[];
      kd=[];
      e=[];
      ec=[];
      p_err=[];
      i_err=[];
      d_err=[];
      t=[];
      op=[];
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
      output = readFromControl_PidState(obj,father)
   end
end
