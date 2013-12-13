function one_cylinder_varying_radius()
base_folder = '/projects/data/dsmc/2013-12-10_one_cylinder/one_cylinder_varying_radius/states/';
radii = [0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45];
permeabilities = [];

for i=1:length(radii)
    radius = radii(i);
    radius_cm = radius*1e-4;
	state_folder = sprintf('%s/%f/01_sampling/',base_folder, radius);
	filename_permeability = sprintf('%s/statistics/permeability.txt',state_folder);
    area = pi*radius^2;
	permeability = dlmread(filename_permeability)/area;
    permeabilities = [permeabilities permeability];
end

knudsen_number = 1.0;
correction_factor = knudsen_correction_factor(knudsen_number); 
analytical_permeabilities = correction_factor*(radii*1e-4).^2/8;

loglog(radii*1e-6, permeabilities,...
    'LineWidth',1.2,...
    'LineStyle','o',...
    'color','r'...
    );

hold on
loglog(radii*1e-6, analytical_permeabilities,...
    'LineWidth',1.2,...
    'color','b'...
    );
%plot(log(radii*1e-6), log(permeabilities))
fontSize = 20;
hax = gca;
set(hax, 'fontsize',fontSize ...
    );

xlabel('Radius [m]', 'fontsize', fontSize);

set(get(hax,'ylabel'), ...
    'String', 'Permeability [cm^2]', ...
    'fontsize',fontSize ...
    );

set(get(hax,'title'), ...
    'String', 'Cylinder permeability', ...
    'fontsize',fontSize ...
    );

legend({'DSMC', 'Analytical'}, 'fontsize', fontSize);

end