function [angles, moes] = sweep_angle_moe()
    angles = linspace(30,60,120);
    moes = zeros(1,120);

    for i = 1:120
        moes(i) = find_moe(angles(i));
    end
end