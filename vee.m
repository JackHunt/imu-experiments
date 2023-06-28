function omega = vee(omega_hat)
%VEE Maps a real, 3x3 skew symmetric matrix to a real 3-vector.
assert(rank(omega_hat) == 2)

assert(size(omega_hat, 1) == 3)
assert(size(omega_hat, 2) == 3)

omega = [omega_hat(3, 2),
         omega_hat(1, 3),
         omega_hat(2, 1)];
end
