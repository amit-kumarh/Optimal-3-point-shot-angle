%% Finds margin of error for given angle

function moe = find_moe(angle)
    speeds = linspace(8, 20, 50);
    makes = [];
    for i = 1:50
        if determine_make(speeds(i), angle)
            makes(end+1) = speeds(i);
        end
    end
    
    moe = makes(end) - makes(1);
end