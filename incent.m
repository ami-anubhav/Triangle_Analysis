function [incenter,r] = incent(A,B,C)
% get the incenter of the triangle by given points
% Find mid points
BC = norm(B-C);
AC = norm(A-C);
BA = norm(B-A);
incenter = [(BC*A(1)+BA*C(1)+AC*B(1))/(BC+AC+BA),...
            (BC*A(2)+BA*C(2)+AC*B(2))/(BC+AC+BA)];
plot(incenter(1),incenter(2),'or','LineWidth',2,'MarkerSize',10)
plot([A(1),incenter(1)],[A(2),incenter(2)],'-b','HandleVisibility','off')
plot([B(1),incenter(1)],[B(2),incenter(2)],'-g','HandleVisibility','off')
plot([C(1),incenter(1)],[C(2),incenter(2)],'-m','HandleVisibility','off')
s = (BC+AC+BA)/2;
Area = sqrt(s*(s-BC)*(s-BA)*(s-AC));
r = Area/s;
viscircles(incenter, r,'Color','r');
% incenter found
end

