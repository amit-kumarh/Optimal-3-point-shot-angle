function [angles, moes] = sweep_angle_moe()
    angles = linspace(30,60,60);
    moes = zeros(1,60);

    for i = 1:60
        moes(i) = find_moe(angles(i));
    end
end