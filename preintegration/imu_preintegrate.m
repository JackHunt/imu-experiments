close all;
clear all;

alpha = pi;
beta = -alpha;
gamma = 2 * alpha;

sigma = 0.01;

omega = [alpha, beta, gamma];
omega_hat = hat(omega);

R = mat_exp(omega_hat);
R_perturbed = so3_perturb(R, sigma);