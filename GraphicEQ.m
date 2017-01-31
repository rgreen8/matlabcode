%Ryan Green
% EE Project Code 
% Create a Graphic equalizer that allows the user to input different levels
% of supression for 6 different ranges of frequency

clc
clf
clear


%% Initialize the Waves that Can Be Run through filter

%Test Signal
Ts = 1/8000;
T = 0.5;
N = T/Ts;
t = 0:Ts:(N-1)*Ts;
f = [500 1000 1500 2000 2500 3000 3500];
signal = cos(2*pi*f(1)*t)+cos(2*pi*f(2)*t) + cos(2*pi*f(3)*t) + cos(2*pi*f(4)*t)...
    + cos(2*pi*f(5)*t) + cos(2*pi*f(6)*t) + cos(2*pi*f(7)*t);


%3 Signals that we are given

[a,x]= audioread('SayMyNameCut.mp3');
[b,y]= audioread('buddha.mp3');
[c,z]= audioread('MusicSnip2.mp3');


switch 4
    case 1
        spec=a;
        sampr = 0:1/T:(N/2 - 1)/T;
        fs = x;
    case 2
        spec=b;
        sampr = 0:1/T:(N/2 - 1)/T;
        fs = y;
    case 3
        spec=c;
        sampr= 0:1/T:(N/2 - 1)/T;
        fs = z;
    case 4
        spec = signal; 
        sampr = 0:1/T:(N/2 - 1)/T;
        fs = 4000;
end
specr = abs(fft(spec));
figure(1)
plot(sampr, specr(1:length(sampr)));
title( 'Initial Sample')

%% Define The Parameters of the Filter

fc(1) = 1;
fc(2) = 1;
fc(3) = 0;
fc(4) = 0;
fc(5) = 0;
fc(6) = 0;

coef = firpm(3, [0 0.2 0.4 0.6 0.8 1], [fc(1) fc(2) fc(3) fc(4) fc(5) fc(6)]); 

%% Run Function Through the Filter

output = filter(coef, 1, spec);
spect = abs(fft(output));
%fvtool(coef, 1);
figure(2)
plot(sampr, spect(1:length(sampr)));
title('Filtered Sample Sample')


%% Graph the rulting Equalizer
figure(3)
fx = [1 2 3 4 5 6];
plot( fx,fc,fx(1),fc(1),'ro',fx(2),fc(2),'ro',fx(3),fc(3),'ro',fx(4),fc(4),'ro'...
    ,fx(5),fc(5),'ro',fx(6),fc(6),'ro');
axis( [1 6 0 2]);
title( 'Simplified (Ideal) Filter')


%% Play The Two Samples 

if handles.checkbox1
    sound(spec, fs);
    pause((lenght(spec)/fs)+1);
elseif handels.checkbox2
    sound(output, fs);
    pause((length(spec)/fs)+1)
end




