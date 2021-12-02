function [T, U] = bball_trajectory(speed0, angle)
    
    % Set parameters
    rim_height = 10/3.281; 
    
    % initial conditions
    x0 = 0; 
    y0 = 2; 
    u0 = cosd(angle) * speed0; 
    v0 = sind(angle) * speed0; 
    
    % gravity
    g = 9.8; 
    
    % attributes of a basketball
    mass = 0.62; 
    diameter = .241; % m
    radius = diameter/2; % m
    area = pi * radius^2; % m^2
    
    % density of air at 20 C near sea level
    rho = 1.2; 
    
    % coefficient of drag for a baseball
    C_d = 0.54;  % dimensionless
    
    %% Run ODE solver
    % Set event for ground collision
    options = odeset('Events', @event_range_met);
    
    % Run solver
    init_conditions = [x0; y0; u0; v0];
    [T, U] = ode45(@rate_func, [0, 6], init_conditions, options);
    
    %% Helper functions
        
    function res = rate_func(~, State)
            u = State(3); % horizontal velocity
            v = State(4); % vertical velocity
            
            Velocity = [u, v];
            a_drag = drag_force(Velocity) / mass;
            a_grav = [0, -g];
        
            Acceleration = a_grav + a_drag;
            
            res = [u; v; Acceleration(1); Acceleration(2)];
        end
    
        function res = drag_force(V)
            % Compute the drag force on a baseball.
            mag = - (0.5 * rho * norm(V)^2) * C_d * area;
            direction = hat(V);
            res = direction * mag;
        end
        
        function res = hat(V)
            % Compute a unit vector in the direction of V.
            res = V / norm(V);
        end
        
        function [value, isterminal, direction] = event_range_met(~, State)
            % Stop when the ball's y position reaches the rim height.
            y = State(2);
            value = y - rim_height;
            isterminal = 1;
            direction = -1;
        end    
end