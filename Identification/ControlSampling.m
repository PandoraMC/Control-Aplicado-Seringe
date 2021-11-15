SPV = 75;
SB = 10;
s = serialport('COM4', 9600);
pause(2);
base = randi([0, 100], [1, SB]);
samples = (ones(SPV, 1)* base);
samples = samples(:);
N = length(samples);
Response = zeros(N, 4);
t = zeros(N, 1);
tic
for i = 1: N
    tic
    write(s, samples(i), 'uint8');
    while(s.NumBytesAvailable < 4)
    end
    Response(i, :) = read(s, 4, 'uint8');
    plot([(1:i)' (1:i)'], [Response(1:i, 2) Response(1:i, 3)], 'Linewidth', 2)
    drawnow;
    t(i) = toc;
    while(t(i) < 0.065)
        t(i) = toc;
    end
end
write(s, 0, 'uint8');
read(s, 4, 'uint8');

clc
clear s

disp('Sampling ended')
plot([(1:N)' (1:N)'], [Response(:, 2) Response(:, 3)], 'Linewidth', 2)
legend({'$PPS$', '$u(t)$'}, 'interpreter', 'latex', 'location', 'bestoutside')