figure(1)
hold on
xlabel('u')
ylabel('v')
xlim([0 1])
ylim([0 1])
fun = @(u) 1-u;
fplot(fun, [0 1], 'Red', 'Linewidth',3)
txt1 = text(0.47,0.60,'biodiversity');
set(txt1, 'Rotation', -38, 'Color','Black','FontWeight','bold', 'Fontsize',18);
txt2 = text(0.41,0.52,'bioselectivity');
set(txt2, 'Rotation', -39, 'Color', 'Black','FontWeight','bold', 'Fontsize',18);
set(gcf,'Color','w')
red_box = fill([0 1 0], [0 0 1],'r')
set(red_box, 'facealpha', 0.2);
set(red_box, 'edgealpha', 0);
black_box = fill([1 1 0], [0 1 1], 'g')
set(black_box, 'facealpha', 0.2);
set(black_box, 'edgealpha', 0);
title('Figure 6')
box on;
hold off