function nll = so3_gaussian_nll(R, R_perturbed, sigma)
%SO3_GAUSSIAN Evaluate the Gaussian Negative Log Likelihood
%on the SO(3) manifold.
    eta = matLog(R \ R_perturbed);
    nll = 0.5 * eta' * (sigma \ eta);
end

