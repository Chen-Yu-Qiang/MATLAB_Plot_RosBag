function d_out = move2pi(t,d,ti,r)
% t = input time list
% d = input data list
% ti = time interval without first & last
% r = the number of laps in the interval
    if (length(ti)+1)~=length(r)
        error("The time interval does not match the number of laps")
    end
    ti=[min(t) ti max(t)];
    for i=1:length(ti)-1
        logicalArr = t>=ti(i) & t<=ti(i+1);
        d=d+logicalArr*r(i);
    end
    d_out=d;
end

