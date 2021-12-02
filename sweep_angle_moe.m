function [angles, moes] = sweep_angle_moe()
    angles = linspace(30,60,100);
    moes = zeros(1,100);

    for i = 1:100
        moes(i) = find_moe(angles(i));
    end
end