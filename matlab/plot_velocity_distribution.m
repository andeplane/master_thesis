function plot_velocity_distribution()
    data = dlmread('/projects/master/code/base_code/statistics/velocity_distribution.txt');
    v = data(:,1);
    
    count = data(:,2);
    area = trapz(v,count);
    
    %area = sum(count);
    count = count / area;
    
    k = 1.3806488e-23;
    m = 6.63352088e-26;
    T = 298.543;
    
    p = sqrt(m/(2*pi*k*T))*exp(-m*v.^2/(2*k*T));
    
    plot(v,count,'ro',...
    'LineWidth',1.5,...
    'color','r');

    hold on
    plot(v,p,...
    'LineWidth',1.5);

    fontsize = 20;
    
    hax = gca;
    set(hax, 'fontsize',fontsize ...
    );
    
    xlabel('v [m/s]',...
    'fontsize',fontsize);

    ylabel('P(v)',...
    'fontsize',fontsize);
    
    title('Velocity distribution',...
        'fontsize',fontsize ...
        );

    legend({'DSMC','Maxwell-Boltzmann T=298.5K'},...
    'fontsize',fontsize);
end