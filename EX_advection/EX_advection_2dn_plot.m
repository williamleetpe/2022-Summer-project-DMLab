% customcolour
% customcolourmap
font_size = 24;
font_name = 'Times New Roman';
line_width = 1;

figure(1); clf
plot_sol = subplot(2,2,1);
contourf(X,Y,QNum,-2:0.01:2,'linecolor','none')
axis equal
xlim([-L,L])
ylim([-L,L])
xticks([-10,-5,0,5,10])
yticks([-10,-5,0,5,10])
xlabel('\itx')
ylabel('\ity')
title('Numerical solution',"FontSize",font_size*1.2)
colormap(plot_sol,cmap_seismic)
colorbar("linewidth",line_width*2)
caxis([-1.1 1.1])
set(gca,"LineWidth",line_width*2,"FontName",font_name,"FontSize",font_size)

plot_abse = subplot(2,2,2);
contourf(X,Y,QNum-QAna,-2:0.01:2,'linecolor','none')
axis equal
xlim([-L,L])
ylim([-L,L])
xticks([-10,-5,0,5,10])
yticks([-10,-5,0,5,10])
xlabel('\itx')
ylabel('\ity')
title('Absolute error',"FontSize",font_size*1.2)
colormap(plot_abse,cmap_seismic)
colorbar("linewidth",line_width*2)
caxis([-0.4 0.4])
set(gca,"LineWidth",line_width*2,"FontName",font_name,"FontSize",font_size)

plot_rms = subplot(2,2,[3,4]);
hold on
plot(T(1:t)/(2*pi/Omg),E(1:t),"Color",'k',"LineWidth",line_width)
plot(T(1:t)/(2*pi/Omg),Ef(1:t),"Color",myblue,"LineWidth",line_width)
plot(T(1:t)/(2*pi/Omg),Ea(1:t),"Color",myred,"LineWidth",line_width)
scatter(T(t)/(2*pi/Omg),Ea(t),108,'MarkerEdgeColor',myred,'MarkerFaceColor','w','LineWidth',line_width)
scatter(T(t)/(2*pi/Omg),Ef(t),108,'MarkerEdgeColor',myblue,'MarkerFaceColor','w','LineWidth',line_width)
scatter(T(t)/(2*pi/Omg),E(t),108,'MarkerEdgeColor','k','MarkerFaceColor','w','LineWidth',line_width)
hold off
legend('rms^2','dispersion error','dissipating error',"Location","northwest","Box",'off')
xlim([0,2])
ylim([0,0.001])
xlabel('Time [period]')
ylabel('Error')
title('Error accumulation')
set(gca,"LineWidth",line_width*2,"FontName",font_name,"FontSize",font_size,"Box",'on',"YScale","linear")

sgtitle('2D Non-Linear Advection',"FontSize",font_size*1.8,"FontName",font_name,"FontWeight",'bold')

annotation('textbox',[0.76,0.883,0.1,0.1],'String',{'Spatial differentiation: FFT';'Temporal integration: FD1'},'FitBoxToText','on',"LineStyle",'none',"FontName",font_name,"FontSize",font_size*0.6);
set(gcf,"Position",[100,100,1120,840])