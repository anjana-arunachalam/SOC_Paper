%This code takes in the angular position of the shoulder and elbow joints
%and then converts it to the corresponding end effector positions based on
%the auxillary data
function EEPos = EndEffectorPos(q,auxdata)

theta_shoulder = q(1,:);
theta_elbow = q(2,:);

EEPos =  [cos(theta_shoulder).*auxdata.l1 + cos(theta_shoulder + theta_elbow).*auxdata.l2; ...
         sin(theta_shoulder).*auxdata.l1 + sin(theta_shoulder + theta_elbow).*auxdata.l2 ];
end

