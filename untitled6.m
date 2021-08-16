%% test adata
clear all
a=AData()
a.fileName="2021-01-21-20-37-33";
a.topicName="from_box_b"
a.readFromGeom_Twist()


%% test rosbagdatat
clear all
b=RosbagData();
b.fileName="2021-01-21-20-37-33";
b.readrosbag()

%% plot
b.plot3axis([b.p_imu,b.p_kf,b.p_pad,b.p_ref])
b.plot3axis([b.v_imu,b.v_kf,b.v_cmd])
b.plot3axis([b.a_imu])