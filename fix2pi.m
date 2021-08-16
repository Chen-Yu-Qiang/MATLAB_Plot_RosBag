function d_out = fix2pi(d,ang)
    r=0;
    d_out=[];
    for i=2:length(d)
        if d(i)-d(i-1)>ang*0.7
            r=r-1;
        elseif d(i)-d(i-1)<ang*(-0.7)
            r=r+1;
        end
        d_out(i)=d(i)+r*ang;
    end
end

