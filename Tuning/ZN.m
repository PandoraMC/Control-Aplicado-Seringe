s = tf('s');
cTF = d2c(zTF, 'zoh');
[y, t] = step(cTF);
subplot(211)
plot(t,y)

K = max(y) - min(y);
e = (y - min(y));
[~, tau] = min(e < .63*K);
m = (y(tau) - y(tau - 1))/(t(tau) - t(tau - 1));
L = -y(tau)/m + t(tau) + 65e-3/2;
T = (K - y(tau))/m + t(tau) - L;
r = m*(t - t(tau)) + y(tau);
t(r > K) = [];
r(r > K) = [];

hold on
plot(t, r)
hold off
%%
Kp = 1.2*T/(K*L);
Ti = 2*L;
Td = 0.5*L;
C = Kp*(1+1/(Ti*s)+Td*s);
F = feedback(C*cTF, 1);
subplot(212)
step(F)
disp([Kp Kp/Ti Kp*Td])