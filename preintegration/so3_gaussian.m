function p = so3_gaussian(R, R_perturbed, sigma)
%SO3_GAUSSIAN Evaluate a Gaussian on the SO(3) manifold.
    alpha = 1 / sqrt((2 * pi)^3 * det(sigma));
    beta = alpha / abs(det(so3_right_jac(R_perturbed)));

    eta = matLog(R \ R_perturbed);
    p = eta' * (sigma \ eta);
    p = beta * exp(-0.5 * p);
end

