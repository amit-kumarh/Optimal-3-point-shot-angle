function res = make_hoop(speed0, angle)
    [T, U] = bball_trajectory(speed0, angle);
    finalx = U(end, 1);
    distance_to_hoop_center = 7.239;
    ball_radius = 0.1143;
    min_distance = distance_to_hoop_center - ball_radius;
    max_distance = distance_to_hoop_center + ball_radius;
   
    res = finalx >= min_distance && finalx <= max_distance;
    
end