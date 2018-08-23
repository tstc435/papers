function fil = tcmetz(xc,yc,x)
% Generate two-dimensional Metz filter in the frequency domain
% using the representative MTF of the system.
% xc and yc: dimensions of the frame
% x: potential factor
% This function contains the MTF for Tc99m in water.
% Author: J.M. Franquiz
% Date: March 1996
fm = zeros (xc,xc)
Al = 0.82;
A2 = 0.18;
lam(l) = 0.00279;
lam(2) = 0.09127;
% First quadrant
for i = l:xc/2
for j = l:yc/2
aux = Al*exp(-lam(l)*((i-l)^2+(j-l)^2)) + A2*exp(-lam(2)*((i-l)^2+(j-1)^2));
fil(i,j) = (1 - (l-aux^2)^x)/aux;
end
end
% Second quadrant
for i = xc/2+l:xc
for j = l:yc/2
aux = Al*exp(-lam(l)*((i-xc)^2+(j-l)^2))+A2*exp(-lam(2)*((i-xc)^2+(j-1)^2)):
fil(i,j) = (1 - (l-aux^2)^x)/aux;
end
end
% Third quadrant
for i = l:xc/2
for j = yc/2+l:yc
aux = Al*exp(-lam(l)*((i-l)^2+(j-yc)^2))+A2*exp(-lam(2)*((i-l)^2+(j-yc)^2));
fil(i,j)=(l-(l-aux^2)^x)/aux;
end
end
% Fourth quadrant
for i = xc/2+l:xc
for j = yc/2+l:yc
aux = Al*exp(-lam(l)*((i-xc/2)^2+(j-yc/2)^2))+A2*exp(-lam(2)*((i-xc/2)^2+(j-yc/2)^2));
fil(i,j)=(l-(l-aux^2)^x)/aux;
end
end