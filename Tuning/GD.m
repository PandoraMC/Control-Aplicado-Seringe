%load('../Data/DataModel.mat');
clc
% K = [(rand - 0.5) rand (rand - 0.5)]';
% K = [-0.1693, 3.3212, -0.0022]';
cTF = d2c(zTF, 'tustin');
s = tf('s');
Ts = 100e-3;
z = tf('z', Ts);
zTF = c2d(cTF, Ts);
for i = 0: 500
%     C = K(1) + K(2)/s + K(3)*s;
%     C = K(1) + K(2)*Ts/(1 - z^-1) + K(3)*(1 - z^-1)/Ts;
    C = K(1) + K(2)*Ts/2*(1 + z^-1)/(1 - z^-1) + K(3)*2*(1 - z^-1)/(1 + z^-1)/Ts;
    T = feedback(C*zTF, 1); 

    [Y, t] = step(T);
    
    m = length(Y);
    R = ones(size(Y));
    stairs(t, [Y R]);
    title(num2str([i K']))
    pause(0.001)
    e = Y - R;
    E = [e cumtrapz(e) [0; diff(e)]];
    K = K - (E'*E)\E'*Y*0.08/m;
%     K = (E'*E)\E'*Y;
%     K = K + E'*e/m*0.01;
end