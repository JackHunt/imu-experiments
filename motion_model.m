function [R_new, v_new, p_new] = motion_model(dt, R, v, p, g, omega, a, ...
                                              b_g, b_a, eta_g, eta_a)
%MOTION_MODEL IMU Motion Model, preintegrating measurements between
%keyframes i and j on the SO(3) Manifold.
    n = size(dt, 1);
    R_new = R;
    for i=1:n
        R_new = R_update(dt, R, omega, b_g, eta_g);
        v_new = v_update(dt, v, R, g, a, b_a, eta_a);
        p_new = p_update(dt, p, v, g, R, a, b_a, eta_a);
    end
end

function R_new = R_update(dt, R, omega, b, eta)
    R_inc = mat_exp(hat(omega - b - eta) * dt);
    R_new = R * R_inc;
end

function v_new = v_update(dt, v, R, g, a, b, eta)
    v_new = v + (g + R * (a - b - eta)) * dt;
end

function p_new = p_update(dt, p, v, g, R, a, b, eta)
    p_new = p + v * dt;
    p_new = p_new + (dt^2 / 2) * (g + (R * (a - b - eta)));
end
