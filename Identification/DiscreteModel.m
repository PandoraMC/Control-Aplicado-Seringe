function [zTF] = DiscreteModel(Phi, y, Ts)
    n = size(Phi, 2)/2;
    Theta = (Phi'*Phi)\Phi'*y(n + 1: end);
    zTF = tf(Theta(n + 1: end)', [1 -Theta(1:n)'], Ts);
end