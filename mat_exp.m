function R = mat_exp(phi)
%MATEXP Maps an element of the so(3) Lie Algebra phi, to its
% corresponding SO(3) Lie Group via the Matrix Exponential.
    assert(size(phi, 1) == 3 && size(phi, 2) == 3);
    R = eye(size(phi));

    phi_norm = norm(phi);
    R = R + (sin(phi_norm) / phi_norm) * phi;
    R = R + ((1 - cos(phi)) / phi_norm^2) * phi^2;
end

