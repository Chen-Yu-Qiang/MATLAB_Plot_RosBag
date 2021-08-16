function [tp,error] = findClosestPredictMeasurePeak(fppt,fppv,fmpt,fmpv)
tp=[];
error=[];
for i=1:length(fmpt)
    [~,ind]=min(abs(fmpt(i)-fppt));
    tp(i)=fppt(ind);
    error(i)=abs(fppv(ind)-fmpv(i));
end

