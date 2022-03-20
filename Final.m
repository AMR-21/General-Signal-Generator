clc;
clear all;
close all;

%Part 1
% %Q1
fs=1000;
t=linspace(-4,4,8*fs);
%a
u = @(t) heaviside(t);
y = @(t) exp(-abs(t)/5) .* (u(t+1)-u(t-3));


%b
y1 = y(3*t);
y2 = y(t+2);
y3 = y(4-2*t);

%c
subplot(2,2,1);
fplot(y,[-2,4]);
title('y(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([-2,4]);
ylim([0,1.1]);

subplot(2,2,2);
plot(t,y1);
title('y1(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([-2,4]);
ylim([0,1.1]);

subplot(2,2,3);
plot(t,y2);
title('y2(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([-2,4]);
ylim([0,1.1]);

subplot(2,2,4);
plot(t,y3);
title('y3(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlim([-4,4]);
ylim([0,1.1]);

%Q2
fs2=20000;
t2=linspace(-0.005,0.005,0.01*fs2);
Fvec=linspace(-fs2/2,fs2/2,length(t2));
%a
mFun= @(t2) sinc(10.^3 * t2).^2;
m = mFun(t2);
figure;
subplot(4,4,[1,8]);
plot(t2,m);
title('m(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

M = fft(m);
subplot(4,4,[9,16]);
plot(Fvec,fftshift(abs(M)));
title('M(w)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%b
fs3=3.*10^5;
t3=linspace(-0.005,0.005,0.01*fs3);
Fvec2=linspace(-fs3/2,fs3/2,length(t3));

r1 = mFun(t3) .* cos(2*pi*10.^5*t3);
figure;
subplot(4,4,[1,8]);
plot(t3,r1);
title('r(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

fsr=3.*10^4; %new fs to show R(W)
tr=linspace(-0.005,0.005,0.01*fsr);
Fvecr=linspace(-fsr/2,fsr/2,length(tr));
r = mFun(tr) .* cos(2*pi*10.^5*tr);
R = fft(r);
subplot(4,4,[9,16]);
plot(Fvecr,fftshift(abs(R)));
title('R(w)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

%Q3
fs4=1000;
t4=linspace(-1,4,5*fs);
xFun=@(t4) exp(-1*t4) .* (u(t4)-u(t4-pi));

figure;
subplot(2,2,[1,2]);
tx = 2*pi;
T = pi; % period
y = -pi:0.001:pi;
x = xFun(mod(y,T));
subplot(2,2,[1,2]);
plot(y,x)
title('x(t)');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

nneg=-8:1:-1;
npos=1:1:8;
D0= 1/pi*(1-exp(-pi));
Dnneg= (1./((j*2*nneg+1)*pi)).*(1-exp(-pi*(1+j*2*nneg)));
Dnpos=(1./((j*2*npos+1)*pi)).*(1-exp(-pi*(1+j*2*npos)));
n=[nneg,0,npos];
Dn=[Dnneg , D0, Dnpos];

subplot(2,2,3);
stem(n,abs(Dn));
title('Magnitude spectrum');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

subplot(2,2,4);
stem(n,angle(Dn));
title('Phase spectrum');
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';





