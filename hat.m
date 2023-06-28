function omega_hat = hat(omega)
%HAT Maps a real 3-vector to a 3x3 real, skew symmetric matrix.
    assert(rank(omega) == 1)
    assert(size(omega, 1) == 3 || size(omega, 2) == 3)

    omega_hat = [[0, -omega(3), omega(2)];
                 [omega(3), 0, -omega(1)];
                 [-omega(2), omega(1), 0]];
end

