function output = readrosbag(self)

    fprintf("\nvvvv  Start reading rosbag  vvvv\n");
  %% set to as takeoff time  

    adata_obj = AData();
    adata_obj.topicName = "tello/imu";
    flag = adata_obj.readFromSensor_Imu(self);
    bag=rosbag(self.fileName+".bag");
    bsel=select(bag,"topic","tello/takeoff");
    msg=readMessages(bsel,'DataFormat','struct');
    t=timeseries(bsel).Time;
    self.t_takeoff=t(end)-self.t0;
    self.t0=t(end);
    clear adata_obj flag bag bsel msg t
    
    %% self.get_a_imu();
    
    adata_obj = AData();
    adata_obj.topicName = "tello/imu";
    adata_obj.yUnit = "m/s^2";
    adata_obj.showName = "IMU";
    flag = adata_obj.readFromSensor_Imu(self);
    if flag==1
        self.data_obj.a_imu = adata_obj;
    end
    clear adata_obj
    %% self.get_v_cmd();
    adata_obj = AData();
    adata_obj.topicName="tello/cmd_vel";
    adata_obj.yUnit="m/s";
    adata_obj.yUnitAng="deg/s";
    adata_obj.showName="Command(Tello)";
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        temp=adata_obj.x;
        adata_obj.x=-adata_obj.y;
        adata_obj.y=temp;
        adata_obj.th=-adata_obj.th.*(180/pi);
        self.data_obj.v_cmd_tello = adata_obj;
    end    
    clear adata_obj
    %% self.get_v_cmd();
    adata_obj = AData();
    adata_obj.topicName="v_cmd";
    adata_obj.yUnit="m/s";
    adata_obj.yUnitAng="deg/s";
    adata_obj.showName="Command(World)";
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        adata_obj.sat(1,-1);
        adata_obj.th=-adata_obj.th.*(180/pi);
        self.data_obj.v_cmd = adata_obj;
    end    
    clear adata_obj
        
    %% self.get_p_ref();
    adata_obj = AData();
    adata_obj.topicName="ref";
    adata_obj.showName="Ref";
    adata_obj.yUnitAng="deg";
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        for i=1:length(adata_obj.z)
            adata_obj.th(i)=adata_obj.th(i)*180/pi;
        end
        adata_obj.th=fix2pi(adata_obj.th,360);
        self.data_obj.p_ref = adata_obj;
    end    
    clear adata_obj    
    
    %% self.get_p_kf();
    adata_obj = AData();
    adata_obj.topicName="from_kf";
    adata_obj.showName="KF";
    adata_obj.yUnitAng="deg";
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        for i=1:length(adata_obj.z)
                adata_obj.th(i)=adata_obj.th(i)*180/pi;
        end
        adata_obj.th=fix2pi(adata_obj.th,360);
        self.data_obj.p_kf = adata_obj;
    end    
    clear adata_obj       
    %% self.get_p_imu();
    adata_obj = AData();
    adata_obj.topicName="from_IMU";
    adata_obj.showName="IMU";
    flag = adata_obj.readFromGeom_PoseStamped(self);
    if flag==1
        for i=1:length(adata_obj.x)
            adata_obj.x(i)=adata_obj.x(i)+self.offset_IMU(1);
            adata_obj.y(i)=adata_obj.y(i)+self.offset_IMU(2);
            adata_obj.z(i)=adata_obj.z(i)+self.offset_IMU(3);
        end
        self.data_obj.p_imu = adata_obj;
    end
    clear adata_obj           
    %% self.get_p_pad();
    adata_obj = AData();
    adata_obj.topicName="from_box_merge";
    adata_obj.showName="Board";
    adata_obj.ang=0;
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        for i=1:length(adata_obj.x)
            if abs(adata_obj.x(i))>10 ||abs(adata_obj.y(i))>10||abs(adata_obj.z(i))>10 
                adata_obj.x(i)=NaN;
                adata_obj.y(i)=NaN;
                adata_obj.z(i)=NaN;
            end
        end
        
        self.data_obj.p_pad = adata_obj;
    end    
    clear adata_obj         
    %% self.get_v_kf();
    adata_obj = AData();
    adata_obj.topicName="v_kf";
    adata_obj.yUnit="m/s";
    adata_obj.yUnitAng="deg";
    adata_obj.showName="KF";
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        self.data_obj.v_kf = adata_obj;
    end    
    clear adata_obj    
    %% self.get_v_imu();
    adata_obj = AData();   
    adata_obj.topicName="tello/odom";
    adata_obj.yUnit="m/s";
    adata_obj.showName="IMU";
    flag = adata_obj.readFromNav_Odom(self);
    if flag==1
        for i=1:length(adata_obj.th)
            adata_obj.th(i)=nan;
        end
        self.data_obj.v_imu = adata_obj;
    end    
    clear adata_obj    
     %% self.get_p_odom();
    adata_obj = AData();   
    adata_obj.topicName="tello/odom";
    adata_obj.yUnit="m/s";
    adata_obj.showName="ODOM";
    flag = adata_obj.readFromNav_Odom_pos(self);
    if flag==1
        for i=1:length(adata_obj.x)
            adata_obj.x(i)=adata_obj.x(i)+self.offset_IMU(1);
            adata_obj.y(i)=adata_obj.y(i)+self.offset_IMU(2);
            adata_obj.z(i)=adata_obj.z(i)+self.offset_IMU(3);
        end
        self.data_obj.p_odom = adata_obj;
    end    
    clear adata_obj    
    %% self.get_v_kf_mean();
    adata_obj = AData();   
    adata_obj.topicName="kf_vmean";
    adata_obj.yUnit="m/s";
    adata_obj.yUnitAng="deg";
    adata_obj.showName="KF,mean";
    flag = adata_obj.readFromGeom_Twist(self);
    if flag==1
        self.data_obj.v_kf_mean = adata_obj;
    end    
    clear adata_obj
    %% self.get_ang_imu();
    adata_obj = AData();   
    adata_obj.topicName="tello/odom";
    adata_obj.yUnitAng="deg";
    adata_obj.showName="IMU";
    flag = adata_obj.readFromNav_Odom(self);
    if flag==1
        for i=1:length(adata_obj.z)
            adata_obj.x(i)=nan;
            adata_obj.y(i)=nan;
            adata_obj.z(i)=nan;
            adata_obj.th(i)=(adata_obj.th(i)+self.offset_IMU(4))*180/pi;
        end
        adata_obj.th=fix2pi(adata_obj.th,360);
        self.data_obj.ang_imu = adata_obj;
    end    
    clear adata_obj        
    %% self.get_ang_imu();
    adata_obj = AData();   
    adata_obj.topicName="tello/odom";
    adata_obj.yUnitAng="deg";
    adata_obj.showName="\theta_{imu}";
    flag = adata_obj.readFromNav_Odom(self);
    if flag==1
        for i=1:length(adata_obj.z)
            adata_obj.x(i)=nan;
            adata_obj.y(i)=nan;
            adata_obj.z(i)=nan;
            adata_obj.th(i)=(adata_obj.th(i)+self.offset_IMU(4))*180/pi;
        end
        self.data_obj.ang_imu_unfix = adata_obj;
    end    
    clear adata_obj        
    %% self.get_ang_vp();
    adata_obj = AData();   
    adata_obj.topicName="from_img_ang2";
    adata_obj.yUnitAng="deg";
    adata_obj.showName="IMU";
    flag = adata_obj.readFromFloat32(self);
    if flag==1
        for i=1:length(adata_obj.z)
            adata_obj.x(i)=nan;
            adata_obj.y(i)=nan;
            adata_obj.z(i)=nan;
            adata_obj.th(i)=adata_obj.th(i)*180/pi;
        end
        adata_obj.th=fix2pi(adata_obj.th,360);
        self.data_obj.ang_vp = adata_obj;
    end    
    clear adata_obj        
    
    %% self.get_v_ang_imu();
    adata_obj = AData();   
    adata_obj.topicName="tello/imu";
    adata_obj.yUnitAng="deg/s";
    adata_obj.showName="IMU";
    flag = adata_obj.readFromSensor_Imu(self);
    if flag==1
        for i=1:length(adata_obj.z)
            adata_obj.x(i)=nan;
            adata_obj.y(i)=nan;
            adata_obj.z(i)=nan;
            adata_obj.th(i)=adata_obj.th(i)*(-180/pi);
        end
        adata_obj.th=fix2pi(adata_obj.th,360);
        self.data_obj.v_ang_imu = adata_obj;
    end    
    clear adata_obj
    

    
    
    %%  box in imega
    adata_obj = AData();   
    adata_obj.topicName="box_in_img_r";
    adata_obj.yUnit="pix";
    adata_obj.showName="Red";
    flag = adata_obj.readFromGeom_Point(self); 
    self.data_obj.ri = adata_obj;
    clear adata_obj
    
    adata_obj = AData();   
    adata_obj.topicName="box_in_img_g";
    adata_obj.yUnit="pix";
    adata_obj.showName="Green";
    flag = adata_obj.readFromGeom_Point(self); 
    self.data_obj.gi = adata_obj;
    clear adata_obj
    
    adata_obj = AData();   
    adata_obj.topicName="box_in_img_b";
    adata_obj.yUnit="pix";
    adata_obj.showName="Blue";
    flag = adata_obj.readFromGeom_Point(self); 
    self.data_obj.bi = adata_obj;
    clear adata_obj
    
    %% pid x
    adata_obj = PIDData();   
    adata_obj.topicName="x_pid";
    flag = adata_obj.readFromControl_PidState(self);
    if flag==1
        self.data_obj.x_pid = adata_obj;
    end    
    clear adata_obj
    %% pid y
    adata_obj = PIDData();   
    adata_obj.topicName="y_pid";
    flag = adata_obj.readFromControl_PidState(self);
    if flag==1
        self.data_obj.y_pid = adata_obj;
    end    
    clear adata_obj
    %% pid z
    adata_obj = PIDData();   
    adata_obj.topicName="z_pid";
    flag = adata_obj.readFromControl_PidState(self);
    if flag==1
        self.data_obj.z_pid = adata_obj;
    end    
    clear adata_obj
    %% pid th
    adata_obj = PIDData();   
    adata_obj.topicName="th_pid";
    flag = adata_obj.readFromControl_PidState(self);
    if flag==1
        self.data_obj.th_pid = adata_obj;
    end    
    clear adata_obj    
    
    
    
    dt = datetime( self.t0,'TimeZone','local', 'ConvertFrom', 'posixtime' );
    self.t0_str=datestr( dt,'yyyy-mm-dd HH:MM:SS.FFF' );
    fprintf("^^^^  Finish reading rosbag  ^^^^\n");
end
