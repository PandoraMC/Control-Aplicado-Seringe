function [Phi] = GeneratePhi(u, y, order)
    NSamples = length(u);
    Phi = zeros(NSamples - order, 2*order);
    for r = 1: NSamples - order
        f = zeros(1, 2*order);
        for c = 1: order
            f(c) = y(r + order - c);
            f(order + c) = u(r + order - c);
        end
        Phi(r, :) = f;
    end
end