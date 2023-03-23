function dy=simuequ(t,y)
dy = zeros(5,1);
de = 2;
load sysMatrix.mat A B ;

dy(1) = A*y + B*de;

