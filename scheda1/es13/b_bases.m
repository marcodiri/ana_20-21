function [x_ax, bases_matx] = b_bases(y,p,plotit)
%B_BASES

arguments
    y
    p
    plotit = false % plot bases or not
end

y = sort(y); % nodes need to be in ascending order
starting_n_bases = length(y)-1; % initial number of bases (p=0)

x_ax = [min(y):.01:max(y)]; % x axis

% Each row is a Bp,i (vector), each iteration the previous basis i of 
% degree p gets overridden, if we wanted to keep them we would have had 
% to create a 3D matrix like bases_matx = zeros(p,length(x_ax),length(y)-1) 
% such that each bases_matx(p,:,i) would be a Bp,i.
bases_matx = zeros(starting_n_bases,length(x_ax));
for current_p=0:p
    for i=1:starting_n_bases
        % start the recurrence with bases that are 1 in [y(i),y(i+1)),
        % 0 otherwise
        if current_p == 0
            basis = zeros(1,length(x_ax));
            basis(y(i)<=x_ax & x_ax<y(i+1)) = 1;
            bases_matx(i,:) = basis;
        else
            % every subsequent degree we get one less basis
            if i>starting_n_bases-current_p
                break;
            end
            % De Boor formula
            bases_matx(i,:) = (x_ax-y(i))/(y(i+current_p)...
                -y(i)).*bases_matx(i,:)...
                +(y(i+current_p+1)-x_ax)/(y(i+current_p+1)...
                -y(i+1)).*bases_matx(i+1,:);
        end
    end
    % finished computing current_p degree bases, remove the last one
    % since we don't need it anymore
    if current_p > 0
        if size(bases_matx,1) == 1 % p was smaller than length(y)+2
            throw(MException('MATLAB:invalidInput',...
            '%d nodes needed to compute basis of order %d, only %d nodes given',...
            current_p+2,current_p,length(y)));
        end
        bases_matx(size(bases_matx,1),:) = [];
    end
    
    % plotting stuff
    if plotit
        figure
        hold on
        for i=1:size(bases_matx,1)
            basis = bases_matx(i,:); % basis Bp,i
            % note: the p=0 bases may look like diagonal in the plot 
            % depending on the granularity of the x axis because
            % the istantaneous jump from 0 to 1 cannot be represented
            plot(x_ax,basis,'HandleVisibility','off','DisplayName','');
        end
        scatter(y,zeros(1,length(y)),'filled','DisplayName','nodes');
        axis([min(y)-.5 max(y)+.5 -.1 1.1])
        hline(0);
        hold off
        title(sprintf("basis of degree p=%d",current_p))
        legend
    end
end

end

