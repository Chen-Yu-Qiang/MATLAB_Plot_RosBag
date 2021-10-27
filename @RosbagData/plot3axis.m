function output = plot3axis(self,plotobj)
    output=figure;
    legendlist=[];
    for i=plotobj
	if length(i.t)<1
		continue
	end
        subplot(3,1,1)
        hold on 
        plot(i.t,i.x,i.plotMarker)
        subplot(3,1,2)
        hold on 
        plot(i.t,i.y,i.plotMarker)
        subplot(3,1,3)
        hold on 
        plot(i.t,i.z,i.plotMarker)  
        legendlist=[legendlist,i.showName];
    end
    subplot(3,1,1)
    xlim([self.tmin,self.tmax])
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("X("+plotobj(1).yUnit+")")
    [~,Leg]=legend(legendlist);
    objhl = findobj(Leg, 'type', 'line');
    set(objhl, 'Markersize', 15);
    grid on
    subplot(3,1,2)
    xlim([self.tmin,self.tmax])
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("Y("+plotobj(1).yUnit+")")
    grid on
    subplot(3,1,3)
    xlim([self.tmin,self.tmax])  
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("Z("+plotobj(1).yUnit+")")
    grid on
end
