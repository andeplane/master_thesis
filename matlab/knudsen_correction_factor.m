function correction_factor = knudsen_correction_factor(kn)
    correction_factor = (1 + alpha(kn).*kn).*(1 + 4*kn./(1 + kn));
end

function ret = alpha(kn)
    A = 0.17;
    B = 0.4348;
    alpha0 = 1.358;
    ret = alpha0 ./ (1 + A./kn.^B);
end