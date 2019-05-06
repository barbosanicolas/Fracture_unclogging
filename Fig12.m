clear all;

%% Fig 12 of Fracture unclogging: A numerical study of seismically induced viscous shear stresses in fluid-saturated fractured rocks
% based on the results of Fig. 11

%% normal plot
da=[1.5 3];
a=[1.5 2.25 3];

A_rev=0.4^2;
A_frac_d15=A_rev*da(1)/100;
A_frac_d3=A_rev*da(2)/100;

tau_d15=[77.25 23.29 4.29]./A_frac_d15;
tau_d3=[222.392 91.51 24.81]./A_frac_d3;

tau_d15_s=[153.46 31.05 5.35]./A_frac_d15;
tau_d3_s=[710.64 110.065 29.21]./A_frac_d3;


figure(1)
set(1,'Units','inches','Position',[10 10 10 7.5],'PaperPositionMode','auto');
plot(a, tau_d15, 'ob','MarkerSize',7.5,'LineWidth',2.5,'MarkerFaceColor','b');hold on
plot(a, tau_d3, 'or','MarkerSize',7.5,'LineWidth',2.5,'MarkerFaceColor','r');hold on
plot(a, tau_d15_s, 'ob',a, tau_d3_s, 'or','MarkerSize',7.5,'LineWidth',2);
xlim([1 3.5]);ylim([0 17.5e4]);axis square
xlabel('a [-]');ylabel('\tau_{xy}/A_{frac} [Pa/m^2]')
legend('P-wave, d_a = 1.5 %','P-wave, d_a = 3 %',...
    'S-wave, d_a = 1.5 %','S-wave, d_a = 3 %');set(gca, 'fontsize', 20);grid on
% print -dpng tau_area_log_P_and_S

%% relative differences 
rel_diff=(tau_d3- tau_d15)./tau_d15
rel_diff_s=(tau_d3_s- tau_d15_s)./tau_d15_s