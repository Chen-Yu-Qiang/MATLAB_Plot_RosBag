function [tp,vp]=findPredictPeak(t,x)
dx=[];
n=6;
for i=1:length(x)-1
    dx(i)=(x(i+1)-x(i))/(t(i+1)-t(i));
end
%figure
%plot(t(1:end-1),dx,"-")
%[b,i]=sort(abs(dx));
%vp=x(i(end-n:end));
%tp=t(i(end-n:end));
%[tp,i]=sort(tp);
%vp=vp(i);
%tp=tp(2:end);
%vp=vp(2:end);
[b,i]=findpeaks(abs(dx),"Threshold",0.1,"MinPeakDistance",50)
figure
plot(t(1:end-1),abs(dx),t(i),b,"ro")
grid on
xlabel("Time t_m(k) [s]")
legend("\Delta x_p(k)/\Delta t_p(k)","Peaks")
tp=t(i(2:end));
vp=x(i(2:end));
end
