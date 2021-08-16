function output = plot2pix(self,plotobj)
    output=figure;
    legendlist=[];
    ax1=subplot(3,1,1);
    ax2=subplot(3,1,2);
    ax3=subplot(3,1,3);
    output.UserData=[ax1,ax2,ax3];
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
    ylabel("Horizontal("+plotobj(1).yUnit+")")
    legend(legendlist,'Location','best')
    grid on
    ylim([0 960])
    subplot(3,1,2)
    xlim([self.tmin,self.tmax])
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("Vertical("+plotobj(1).yUnit+")")
    grid on
    ylim([0 720])
    subplot(3,1,3)
    xlim([self.tmin,self.tmax])  
    if plotobj(1).xlabel=="Time"
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+") t_0="+self.t0_str)
    else
        xlabel(plotobj(1).xlabel+"("+plotobj(1).xUnit+")")
    end
    ylabel("Width("+plotobj(1).yUnit+")")
    grid on
    ylim([0 960])
end

