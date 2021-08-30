function hline(y)
%HLINE draw an horizontal line at specified y, 
%use AFTER every other plot to get correct xlim
line(xlim,[y,y],'LineWidth',1,'Color','[0,0,0,.2]',...
    'HandleVisibility','off','DisplayName','');
end

