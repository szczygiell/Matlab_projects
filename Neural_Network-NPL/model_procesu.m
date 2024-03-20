function [y, x1, x2] = model_procesu(x1k, x2k, uk)

    g1 = (exp(7.5*uk)-1)/(exp(7.5*uk)+1);

    x1 = 1.626651*x1k + x2k + 0.013274 * g1;
    x2 = -0.657673*x1k + 0.011544 * g1;
    g2 = 1.25*(1-exp(-2*x1));
    y = g2;

end