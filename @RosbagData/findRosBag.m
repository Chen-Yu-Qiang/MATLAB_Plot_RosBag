function output=findRosBag(self)
    D=dir;
    for i=1:length(D)
        if length(strfind(D(i).name,".bag"))>0
            output=D(i).name(1:end-4);
            break
        end
    end
    fprintf("\nFind the ROSBAG file : "+output+".bag\n");

end