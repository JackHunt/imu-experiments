function R_perturbed = so3_perturb(R, sigma)
%SO3_PERTURB Applies zero mean, sigma variance noise so an SO(3) rotation.
    eta = mvnrnd(zeros(3, 1), sigma * eye(3, 3));
    eta = matExp(hat(eta));
    R_perturbed = R * eta;
end

