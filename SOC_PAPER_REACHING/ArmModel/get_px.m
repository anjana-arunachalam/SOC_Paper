function px = get_px(q2,auxdata,q1)
p_full = EndEffectorPos([q1;q2],auxdata);
px = p_full(1);
end
%Think this function simlpy extracts the x coordinate position from the
%endEffector position variable