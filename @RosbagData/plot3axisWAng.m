function output = plot3axisWAng(self,plotobj,plogangobj)
    output=figure;
    legendlist=[];
    
    ax1=subplot(4,1,1);
    ax2=subplot(4,1,2);
    ax3=subplot(4,1,3);
    ax4=subplot(4,1,4);
    output.UserData=[ax1,ax2,ax3,ax4];
    for i=plotobj
        if length(i.t)<1
            continue
        end
        subplot(4,1,1)
        hold on 
        plot(i.t,i.x,i.plotMarker)
        subplot(4,1,2)
        hold on 
        plot(i.t,i.y,i.plotMarker)
        subplot(4,1,3)
        hold on 
        plot(i.t,i.z,i.plotMarker)  
        legendlist=[legendlist,i.showName];
    end
    for i=plogangobj
        subplot(4,1,4)
        hold on 
        plot(i.t,i.th,i.plotMarker)  
        legendlist=[legendlist,i.showName];        
    end
    subplot(4,1,1)
    xlim([self.tmin,self.tmax])

    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("X("+plotobj(1).yUnit+")")
    [~,Leg]=legend(legendlist,'Location','best')
    objhl = findobj(Leg, 'type', 'line')
    set(objhl, 'Markersize', 15);
    grid on
    subplot(4,1,2)
    xlim([self.tmin,self.tmax])
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("Y("+plotobj(1).yUnit+")")
    grid on
    subplot(4,1,3)
    xlim([self.tmin,self.tmax])  
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("Z("+plotobj(1).yUnit+")")
    grid on
    subplot(4,1,4)
    xlim([self.tmin,self.tmax])  
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("\theta("+plogangobj(1).yUnitAng+")")
    grid on
end
