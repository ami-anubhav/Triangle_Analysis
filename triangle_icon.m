clc; clearvars;
dec = 6; % decimal tolerance
% points of triangle
A = [5, 8.66];
B = [0, 0];
C = [10, 0.1];
% plot triangle
ABC = cat(1,A,B,C,A);
figure(1)
hold on
axis equal
axis square
plot(ABC(:,1),ABC(:,2),'k','LineWidth',5)
% centroid, in, circum and ortho-center calculation
[incenter,r] = incent(A,B,C);
mid_A(1,:) = (A(:) + incenter(:))./2;
mid_B(1,:) = (B(:) + incenter(:))./2;
mid_C(1,:) = (C(:) + incenter(:))./2;
viscircles(mid_A, r,'Color','b','LineWidth',10);
viscircles(mid_B, r,'Color','g','LineWidth',10);
viscircles(mid_C, r,'Color','r','LineWidth',10);
hold off
% end of triangle points finding code


