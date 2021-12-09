function gen_contour_plot()  
    angles = linspace(30, 60, 200);
    speeds = linspace(9.5, 11.5, 600);
    
    
    
    makes = nan(600, 200);
    
    for angle = 1:200
        for speed = 1:600
            makes(speed, angle) = determine_make(speeds(speed), angles(angle));
        end
    end
    
    clf; figure; hold on;
    contourf(angles, speeds, makes, [0 1])
    map = [1 0 0; 0 1 0];
    colormap(map)
    title('Figure 2: Makes vs misses')
    xlabel('Launch Angle')
    ylabel('Launch Velocity (m/s)')
end