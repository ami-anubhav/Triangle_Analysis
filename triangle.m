clc; clearvars;
dec = 6; % decimal tolerance
% points of triangle
A = [5, 5];
B = [0, 0];
C = [4, 1];
% plot triangle
ABC = cat(1,A,B,C,A);
figure(1)
hold on
axis equal
axis square
plot(ABC(:,1),ABC(:,2),'k','LineWidth',2,'HandleVisibility','off')
% centroid, in, circum and ortho-center calculation
centroid = cent(A,B,C,dec);
[incenter,r] = incent(A,B,C);
[circumcenter,r] = circum(A,B,C,dec);
orthocenter = ortho(A,B,C,dec);
% text(centroid(1),centroid(2),'\uparrow centroid','FontSize',14)
% text(incenter(1),incenter(2),'\leftarrow incenter','FontSize',14)
% text(circumcenter(1),circumcenter(2),'\leftarrow circumcenter','FontSize',14)
% text(orthocenter(1),orthocenter(2),'\leftarrow orthocenter','FontSize',14)
% finding the perfect boundery for plotting
XY_min = circumcenter-r;
XY_max = circumcenter+r;
if XY_min(1)>orthocenter(1)
    XY_min(1) = orthocenter(1);
end
if XY_min(2)>orthocenter(2)
    XY_min(2) = orthocenter(2);
end
if XY_max(1)<orthocenter(1)
    XY_max(1) = orthocenter(1);
end
if XY_max(2)<orthocenter(2)
    XY_max(2) = orthocenter(2);
end
% plotting the extention line for each sides of triangle
x = linspace(XY_min(1)*1.06,XY_max(1)*1.06); % operation range
% Aline is the BC line
coeff = polyfit([B(1), C(1)], [B(2), C(2)], 1);
a_Aline = coeff(1);
b_Aline = coeff(2);
Aline = a_Aline*x + b_Aline;
% Bline is the AC line
coeff = polyfit([A(1), C(1)], [A(2), C(2)], 1);
a_Bline = coeff(1);
b_Bline = coeff(2);
Bline = a_Bline*x + b_Bline;
% Cline is the AB line
coeff = polyfit([B(1), A(1)], [B(2), A(2)], 1);
a_Cline = coeff(1);
b_Cline = coeff(2);
Cline = a_Cline*x + b_Cline;
plot(x,Aline,':b',x,Bline,':g',x,Cline,':m')
xlim([XY_min(1)*1.06 XY_max(1)*1.06])
ylim([XY_min(2)*1.06 XY_max(2)*1.06])
legend('Centroid','Incenter','Circumcenter','Orthocenter')
hold off
% end of triangle points finding code


