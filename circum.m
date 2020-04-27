function [circumcenter,r] = circum(A,B,C,dec)
% get the circumcenter of the triangle by given points
error = 1; % recheck switch
% Find mid points
mid_A = (B(:) + C(:))./2;
mid_B = (C(:) + A(:))./2;
mid_C = (B(:) + A(:))./2;
% Aline is the BC line
coeff = polyfit([B(1), C(1)], [B(2), C(2)], 1);
a_Aline = coeff(1);
b_Aline = coeff(2);
% Aline = a_Aline*x + b_Aline;
% Bline is the AC line
coeff = polyfit([A(1), C(1)], [A(2), C(2)], 1);
a_Bline = coeff(1);
b_Bline = coeff(2);
% Bline = a_Bline*x + b_Bline;
% Cline is the AB line
coeff = polyfit([B(1), A(1)], [B(2), A(2)], 1);
a_Cline = coeff(1);
b_Cline = coeff(2);
% Cline = a_Cline*x + b_Cline;

% Find circumcenter
% perpendicular to Aline from midpoint BC
ap_Aline = round(-1/a_Aline,dec);
bp_Aline = (-ap_Aline*mid_A(1)+mid_A(2));
% p_Aline = ap_Aline*x + bp_Aline;
% perpendicular to Bline from midpoint AC
ap_Bline = round(-1/a_Bline,dec);
bp_Bline = (-ap_Bline*mid_B(1)+mid_B(2));
% p_Bline = ap_Bline*x + bp_Bline;
% perpendicular to Cline from midpoint AB
ap_Cline = round(-1/a_Cline,dec);
bp_Cline = (-ap_Cline*mid_C(1)+mid_C(2));
% p_Cline = ap_Cline*x + bp_Cline;
% Aline and Bline intersect
A_AB = [1, -ap_Aline; 1 -ap_Bline];
B_AB = [bp_Aline; bp_Bline];
sol1 = A_AB\B_AB;
% recheck values
A_BC = [1, -ap_Cline; 1 -ap_Bline];
B_BC = [bp_Cline; bp_Bline];
sol2 = A_BC\B_BC;

while error~=0
    if sol1==sol2
        circumcenter = [sol1(2),sol1(1)];
        if error == 2
            disp('decimal error corrected.')
        end
        error = 0; 
        plot(circumcenter(1),circumcenter(2),'hg','LineWidth',2,'MarkerSize',10)
        plot([A(1),circumcenter(1)],[A(2),circumcenter(2)],':b','LineWidth',2,'HandleVisibility','off')
        plot([B(1),circumcenter(1)],[B(2),circumcenter(2)],':g','LineWidth',2,'HandleVisibility','off')
        plot([C(1),circumcenter(1)],[C(2),circumcenter(2)],':m','LineWidth',2,'HandleVisibility','off')
        r = norm(circumcenter-C);
        viscircles(circumcenter, r,'Color','g');
    elseif dec == 0
        disp('no solution of circumcenter.')
        circumcenter = [0,0];
        r = 0;
        break
    else
        disp('some error!')
        error = 2;
        dec = dec-1;
        sol1 = round(sol1,dec);
        sol2 = round(sol2,dec);
    end
end


% incenter found
end

