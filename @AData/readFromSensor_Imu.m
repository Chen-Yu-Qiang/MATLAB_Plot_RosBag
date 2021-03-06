function output = readFromSensor_Imu(obj,father)
    try
        bag=rosbag(father.fileName+".bag");
        bsel=select(bag,"topic",obj.topicName);
        msg=readMessages(bsel,'DataFormat','struct');
        obj.t=timeseries(bsel).Time;
        obj.t=obj.t.';
        if father.t0==0
            father.t0=obj.t(1);
        end
        t0=father.t0;
        obj.t=obj.t-t0;
        ang=obj.ang;
        theta=[];
        for i=1:length(msg)      
            obj.x(i)=msg{i}.LinearAcceleration.X*10;
            obj.y(i)=msg{i}.LinearAcceleration.Y.*10;
            obj.z(i)=-msg{i}.LinearAcceleration.Z.*10-9.8;
            obj.th(i)=msg{i}.AngularVelocity.Z;
        end
        str.x=obj.x;
        str.y=obj.y;
        str.z=obj.y;
        str.t=obj.t;
        str.th=obj.th;
        
        if father.saveEachmat==1
            save(father.fileName+"_"+strrep(obj.topicName,"/","_"),"-struct","str","x","y","z","t","th")
        end
        output = 1;
        fprintf("OK---:"+father.fileName+"_"+obj.topicName+"\n");
    catch
        fprintf("ERROR:"+father.fileName+"_"+obj.topicName+"\n");
        output = 0;
    end
end