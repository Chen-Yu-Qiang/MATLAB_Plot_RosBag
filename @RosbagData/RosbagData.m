classdef RosbagData < handle
   properties (SetAccess = public)
      fileName="";
      t0=0;
      t0_str="";
      ang=12;
      offset_IMU=[0,0,0,0];
      tmin=0;
      tmax=100;
      saveEachmat=0;
      t_takeoff=0;
      data_obj=struct()
      namespace="";
   end
   methods
%       output = get_v_cmd(self)
%       output = get_p_ref(self)
%       output = get_p_kf(self)
%       output = get_p_imu(self)
%       output = get_p_pad(self)
%       output = get_v_kf(self)
%       output = get_v_imu(self)
%       output = get_a_imu(self)
%       output = get_v_kf_mean(self)
      adataObj = get_topic(self,msgType,msgName)
      output = readrosbag(self)
      output = plot3axis(self,plotobj)
      output = plot3axisWAng(self,plotobj,plogangobj)
      output = plot2pix(self,plotobj)
      output = findRosBag(self)
      output = isHaveMat(self)
   end
end
