function p2 = p2(l1,l2,q1,q2)
%P2
%    P2 = P2(L1,L2,Q1,Q2)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    09-Nov-2021 22:14:24

t2 = q1+q2;
p2 = [l1.*cos(q1)+l2.*cos(t2);l1.*sin(q1)+l2.*sin(t2)];

% not sure what this function stands for or does....
