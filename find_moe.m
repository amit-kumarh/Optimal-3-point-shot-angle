%% Finds margin of error for given angle

function moe = find_moe(angle)
    speeds = linspace(7, 13, 500);
    makes = [];
    for i = 1:500
        if determine_make(speeds(i), angle)
            makes(end+1) = speeds(i);
        end
    end
    
    num_makes = size(makes);
    if num_makes(2) >= 1
        moe = makes(end) - makes(1);
    else
        moe = NaN;
    end
end