function phi = mat_log(R)
%MATLOG Maps an element of the SO(3) Lie Group R, to its
% corresponding so(3) Lie Algebra via the Matrix Logarithm.
    psi = sech((trace(R) - 1) / 2); % TODO: Check sech is sin^-1
    phi = psi * (R - R') / (2 * sin(psi));
end

