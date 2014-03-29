cpus_w = 2.^linspace(0,9,10);
cpus_s = [1,8,16,32,64,128,256,512];
%t = [345, 364, 519, 470, 662, 547, 536, 576, 543, 545];
tw = [3450, 3640, 5190, 4700, 6620, 5470, 5360, 5760, 5430, 5450];
ts = [90802, 15372, 6752, 3805, 1706, 785, 415, 250];
eta_s = ts(1)./(cpus_s.*ts);
eta_w = tw(1)./tw;

%plot(cpus,eta_w);
semilogx(cpus_w,eta_w);
hold all
semilogx(cpus_s,eta_s);

fontsize = 20;
hax = gca;
set(hax, 'fontsize',fontsize ...
    );
xlabel('Number of processors',...
    'fontsize',fontsize...
    );
ylabel('Scaling efficiency',...
    'fontsize',fontsize ...
    );
title('Weak scaling efficiency',...
    'fontsize',fontsize ...
    );
legend({'\eta_w','\eta_s'},...
    'fontsize',fontsize)