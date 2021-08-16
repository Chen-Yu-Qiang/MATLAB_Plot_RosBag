function [tp,vp]=findMeasurePeak(t,x)
dx=[];
dt=[];
for i=2:length(x)
    dx(i)=x(i)-x(i-1);
    dt(i)=t(i)-t(i-1);
end
%vp=x(abs(dx)>0.05);
%tp=t(abs(dx)>0.05);
figure
plot(t(1:end),dt,".")
grid on
xlabel("Time t_m(k) [s]")
legend("\Delta t_m(k)")
vp=x(abs(dt)>5);
tp=t(abs(dt)>5);
end
