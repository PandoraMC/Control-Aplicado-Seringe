speed2 = readfis('speed2var.fis');%Linear3
% opt = gensurfOptions;
% opt.NumGridPoints = 511;
% [Error, y, PWM] = gensurf(speed2, opt);
% stairs(Error - min(Error), uint8(PWM));



[Error, y, PWM] = gensurf(speed2);
PWM = uint8(PWM);
mesh(Error, y, PWM)

pbaspect([1 1 1])
writematrix(PWM','LookUp.csv') 