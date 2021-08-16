function output = readFromControl_PidState(obj,father)
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
            obj.kp(i)=msg{i}.PTerm;
            obj.ki(i)=msg{i}.ITerm;
            obj.kd(i)=msg{i}.DTerm;
            obj.p_err(i)=msg{i}.PError;
            obj.i_err(i)=msg{i}.IError;
            obj.d_err(i)=msg{i}.DError;
            obj.e(i)=msg{i}.Error;
            obj.ec(i)=msg{i}.ErrorDot;
            obj.op(i)=msg{i}.Output;
            

        end

        output = 1;
        fprintf("OK---:"+father.fileName+"_"+obj.topicName+"\n");
    catch
        fprintf("ERROR:"+father.fileName+"_"+obj.topicName+"\n");
        output = 0;
    end
end