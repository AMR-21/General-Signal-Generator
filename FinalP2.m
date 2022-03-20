clc;
clear all;
close all;
start = input(' Start ');
ending = input(' End');
f = input(' Sample Frequency');
breakPointsNo = input('Break points');
breakPoints = [];

for i = 1:breakPointsNo
    temp = input(['Breakpoint']);
    breakPoints = [breakPoints temp];
end

t = linspace(start, ending, (ending-start)*f);
signal = [];
temp_start = start;
if isempty(breakPoints)
    temp_end = ending;
else
    temp_end = breakPoints(1);
end

for i = 1:breakPointsNo+1
    Mode = input('Choose a mode');
    signalt = [];
    switch Mode
        case 1
            amp = input('Amp');
            signalt = amp*ones(1, (temp_end-temp_start)*f);
        case 2
            slope = input('Slope');
            int = input('Intercept');
            tempT = linspace(temp_start, temp_end, (temp_end-temp_start)*f);
            signalt = slope*(tempT - int);
        case 3
            amp_poly=[];
            power=input('Power');
            for i=1:power+1
                temp_amp=input(['Coffecient of x']);
            amp_poly=[amp_poly temp_amp];
            end
            int_poly=input('Intercept');
            tempT = linspace(temp_start, temp_end, (temp_end-temp_start)*f);
            signalt = polyval(amp_poly, tempT - int_poly);
        case 4
            amp_exp=input('Amp');
            exponent=input('Exp');
            tempT = linspace(temp_start, temp_end, (temp_end-temp_start)*f);
            x1=amp_exp.*exp(exponent.*tempT);
            signalt=x1;
        case 5
            amp_sin=input('Amp');
            f_sin=input('Frequency');
            phase=input('Phase');
            tempT = linspace(temp_start, temp_end, (temp_end-temp_start)*f);
            x2 = amp_sin.*sin(2*pi*f_sin*tempT+(phase*pi)/180);
            signalt=x2;
    end
    temp_start = temp_end;
    if i >= breakPointsNo
       temp_end = ending;
    else
        
         temp_end = breakPoints(i+1);
    end
   signal = [signal signalt];
end

plot(t, signal);


status = true ;
while status 
Mode = input('Mode');
signaltemp=signal;
switch Mode
    case 1
        plot(t, signaltemp);
    case 2
        amp = input('Scale');
        plot(t, amp*signaltemp);
    case 3
        plot(-t, signaltemp);
        signaltemp=signal;
    case 4
        shift = input('Shift');
        plot(t+shift, signaltemp);
    case 5
        expand = input('Expanding value');
        plot(t*expand, signaltemp);
    case 6
        compressing = input('Compress value');
        plot(t/compressing, signaltemp);
end
status = input('Type true if you want to continue opreations on the signal false if you dont ');
end