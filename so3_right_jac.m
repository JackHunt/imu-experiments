function J = so3_right_jac(phi)
%SO3_RIGHT_JAC Computes the right Jacobian of the SO(3) Lie Group
% corresponding to the so(3) Lie Algebra phi.
    phi_hat = hat(phi);
    phi_norm = norm(phi);

    J = eye(3, 3);
    J = J - ((1 - cos(phi_norm)) / phi_norm^2) * phi_hat;

    a = (phi_norm - sin(phi_norm)) / phi_norm^3;
    J = J + a * phi_hat^2;
end

