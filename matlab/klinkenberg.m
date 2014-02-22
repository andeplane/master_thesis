kn = linspace(0,10,1000);
fc = klinkenberg_correction_factor(kn);
fc2 = knudsen_correction_factor(kn);
relative = fc2 ./ fc;

 plot(kn,fc,...
     'LineWidth',1.3,...
     'color','b',...
     'LineStyle','--');
 
hold on;

[ax, h1, h2] = plotyy(kn,fc2,...
    kn,relative...
    );
set(h1, 'LineWidth', 1.3);
set(h1, 'color', 'b');

set(h2, 'LineWidth', 1.3);
set(ax, 'fontsize', fontsize);
set(get(ax(2), 'Ylabel'), 'String','Relative factor');
set(get(ax(2), 'Ylabel'), 'fontsize', fontsize);

%    'LineWidth',1.3,...
%    'color','b'

%plotyy(kn,relative,...
%    'LineWidth',1.3,...
%    'color','b');

fontsize = 18;
hax = gca;
set(hax, 'fontsize',fontsize);
xlabel('Knudsen number', 'fontsize',fontsize);
ylabel('Correction factor', 'fontsize',fontsize);
title('Correction factors', 'fontsize', fontsize)
legend({'Klinkenberg', 'Knudsen', 'Relative'},'location','south');