%This code takes the shoulder and elbow angular positions, velocities and
%auxillary data to calculate the end effector velocity
%the derivative is calculated analytically using equations instead of
%getting thr numerical derivative based on the end effector position
function EEVel = EndEffectorVel(q,qdot,auxdata)

theta_shoulder = q(1,:);
theta_elbow = q(2,:);
a = theta_shoulder + theta_elbow;
dtheta_shoulder = qdot(1,:);
dtheta_elbow = qdot(2,:);
da = dtheta_shoulder + dtheta_elbow;

EEVel =  [dtheta_shoulder.*sin(theta_shoulder).*auxdata.l1 + da.*sin(a).*auxdata.l2; ...
         -dtheta_shoulder.*cos(theta_shoulder).*auxdata.l1 - da.*cos(a).*auxdata.l2];
end