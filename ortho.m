function orthocenter = ortho(A,B,C,dec)
% get the orthocenter of the triangle by given points
error = 1; % recheck switch
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


% Find orthocenter
% perpendicular to Aline
ap_Aline = round(-1/a_Aline,dec);
bp_Aline = (-ap_Aline*A(1)+A(2));
% p_Aline = ap_Aline*x + bp_Aline;
% perpendicular to Bline
ap_Bline = round(-1/a_Bline,dec);
bp_Bline = (-ap_Bline*B(1)+B(2));
% p_Bline = ap_Bline*x + bp_Bline;
% perpendicular to Cline
ap_Cline = round(-1/a_Cline,dec);
bp_Cline = (-ap_Cline*C(1)+C(2));
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
        orthocenter = [sol1(2),sol1(1)];
        if error == 2
            disp('decimal error corrected.')
        end
        error = 0; 
        plot(sol1(2),sol1(1),'sb','LineWidth',2,'MarkerSize',10)
        plot([A(1),orthocenter(1)],[A(2),orthocenter(2)],'-.b','HandleVisibility','off')
        plot([B(1),orthocenter(1)],[B(2),orthocenter(2)],'-.g','HandleVisibility','off')
        plot([C(1),orthocenter(1)],[C(2),orthocenter(2)],'-.m','HandleVisibility','off')
    elseif dec == 0
        disp('no solution of orthocenter.')
        orthocenter = [0,0];
        break
    else
        disp('some error!')
        error = 2;
        dec = dec-1;
        sol1 = round(sol1,dec);
        sol2 = round(sol2,dec);
    end
end
% orthocenter found
end

