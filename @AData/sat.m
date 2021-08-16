function output = sat(obj,limp,limn)
    for i=1:length(obj.x)
        if obj.x(i)>limp
            obj.x(i)=limp;
        elseif obj.x(i)<limn
            obj.x(i)=limn;
        end
        if obj.y(i)>limp
            obj.y(i)=limp;
        elseif obj.y(i)<limn
            obj.y(i)=limn;
        end
        if obj.z(i)>limp
            obj.z(i)=limp;
        elseif obj.z(i)<limn
            obj.z(i)=limn;
        end
        if obj.th(i)>limp
            obj.th(i)=limp;
        elseif obj.th(i)<limn
            obj.th(i)=limn;
        end
    end
    output = length(obj.x);
end

