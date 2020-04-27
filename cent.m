function centroid = cent(A,B,C,dec)
% get the centroid of the triangle by given points
error = 1; % recheck switch
% Find mid points
mid_A = (B(:) + C(:))./2;
mid_B = (C(:) + A(:))./2;
mid_C = (B(:) + A(:))./2;
% form lines joining mid points
% A line
coeff = polyfit([A(1), mid_A(1)], [A(2), mid_A(2)], 1);
a_Aline = coeff(1);
b_Aline = coeff(2);
% Aline = a_Aline*x + b_Aline;
% B line
coeff = polyfit([B(1), mid_B(1)], [B(2), mid_B(2)], 1);
a_Bline = coeff(1);
b_Bline = coeff(2);
% Bline = a_Bline*x + b_Bline;
% C line
coeff = polyfit([C(1), mid_C(1)], [C(2), mid_C(2)], 1);
a_Cline = coeff(1);
b_Cline = coeff(2);
% Cline = a_Cline*x + b_Cline;
% Aline and Bline intersect
A_AB = [1, -a_Aline; 1 -a_Bline];
B_AB = [b_Aline; b_Bline];
sol1 = A_AB\B_AB;
% recheck values
A_BC = [1, -a_Cline; 1 -a_Bline];
B_BC = [b_Cline; b_Bline];
sol2 = A_BC\B_BC;
while error~=0
    if sol1==sol2
        centroid = [sol1(2),sol1(1)];
        if error == 2
            disp('decimal error corrected.')
        end
        error = 0; 
        plot(sol1(2),sol1(1),'*k','LineWidth',2,'MarkerSize',10)
        plot([A(1),centroid(1)],[A(2),centroid(2)],'--b','HandleVisibility','off')
        plot([B(1),centroid(1)],[B(2),centroid(2)],'--g','HandleVisibility','off')
        plot([C(1),centroid(1)],[C(2),centroid(2)],'--m','HandleVisibility','off')
    elseif dec == 0
        disp('no solution of centroid.')
        centroid = [0,0];
        break
    else
        disp('some error!')
        error = 2;
        dec = dec-1;
        sol1 = round(sol1,dec);
        sol2 = round(sol2,dec);
    end
end
% centroid found
end

