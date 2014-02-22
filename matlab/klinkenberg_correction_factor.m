function correction_factor = klinkenberg_correction_factor(kn)
    c = 1.15;
    correction_factor = (1 + 4*c*kn);
end
