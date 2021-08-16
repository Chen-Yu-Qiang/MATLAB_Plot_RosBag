function [tr,ts,tss,pmo,ss] = MyStepInfo(t,x,t1,t3)
% tr = time of 0~90%(rise time)
% ts = time of max overshoot(peak time)
% tss = time of error last than 10% ss settling time
% pmo = % of max overshoot(percent maximum overshoot)
% ss = value of mean steady state(Steady State)
% [t,x]
% t1 = time of first u=0->1
% t2 = time of x into ss
% t3 = time of end
%   Detailed explanation goes here
if t1==t3
    tr=nan;
    ts=nan;
    tss=nan;
    ss=nan;
    pmo=nan;
    return
end
t2=t3-(t3-t1)*0.7;
k1=find(t>=t1,1);
t_1=t(k1);
x_1=x(k1);
k2=find(t>=t2,1);
t_2=t(k2);
x_2=t(k2);
k3=find(t<=t3,1,'last');
t_3=t(k3);
x_3=x(k3);
x_t=x(k1:k2);
x_in=x(k1:k3);
t_in=t(k1:k3);
ss=mean(x(k2:k3));
IS_NAG=0;
if ss<x_1
    x=-x;
    IS_NAG=1;
    
    t2=t3-(t3-t1)*0.7;
    k1=find(t>=t1,1);
    t_1=t(k1);
    x_1=x(k1);
    k2=find(t>=t2,1);
    t_2=t(k2);
    x_2=t(k2);
    k3=find(t<=t3,1,'last');
    t_3=t(k3);
    x_3=x(k3);
    x_t=x(k1:k2);
    x_in=x(k1:k3);
    t_in=t(k1:k3);
    ss=mean(x(k2:k3));
end

[pmo,pmoi]=findpeaks(x_in,'MinPeakWidth',20);
pmo

t_in(pmoi)
if length(pmo)>=2
    t_in(pmoi(2))-t_in(pmoi(1))
end
if length(pmo)<1
    pmo=nan;
    pmoi=nan;
    ts=nan;
else
    pmo=pmo(1);
    pmoi=pmoi(1);
    ts=t_in(pmoi)-t1;
end

pmo=(pmo-ss)/(ss-x_1);
xr=x_in(find(x_in>=(ss-x_1)*0.9+x_1,1));
tr=t_in(find(x_in>=(ss-x_1)*0.9+x_1,1)-1)-t1;
k4=find(abs(x(k1:k3)-ss)>(ss-x_1)*0.1,1,'last');
if k4<=k3-k1
    tss=t(k4+k1)-t1;
else
    tss=nan;
end
if IS_NAG==1
    ss=-ss;
end
end

