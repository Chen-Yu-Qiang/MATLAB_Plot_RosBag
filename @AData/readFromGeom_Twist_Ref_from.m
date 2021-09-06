function output = readFromGeom_Twist_Ref_from(obj,father)
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
            obj.x(i)=msg{i}.Angular.X;
            obj.y(i)=0;
            obj.z(i)=0;
            obj.th(i)=0;
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