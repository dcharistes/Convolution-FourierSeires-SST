function ask1a_2031

clc;clear;
dt=0.01;
t=-10:dt:10;

for i=1:4
    switch(i)
        case 1 
            x=3/4*heaviside(t+0.25);
            h=exp(-0.25*t).*heaviside(t-0.75);
            c=dt*conv(x,h,'same');
            c_culc=3*(exp(-3/16)-exp(-(4*t+1)/16)).*heaviside(t-0.5);
        case 2
            x=exp(-0.75*t).*(heaviside(t+2)-heaviside(t-0.75));
            h=0.75*heaviside(t)-0.25;
            c=dt*conv(x,h,'same');
            c_culc=(1/3*(exp(-9/16)-exp(3/2)))*(heaviside(t+10)-heaviside(t+2)) + (1/3*(2*exp(3/2)+exp(-9/16))-exp(-0.75*t)).*(heaviside(t+2)-heaviside(t-0.75)) + (2/3*(exp(3/2)-exp(-9/16)))*heaviside(t-0.75);
        case 3
            x=0.75*(heaviside(t+(pi/4))-heaviside(t-(pi/4)));
            h=cos(0.25*t);
            c=dt*conv(x,h,'same');
            c_culc=(-3*(sin(0.25*t-(pi/16))-sin(0.25*t+(pi/16)))).*(heaviside(t+(pi/4))-heaviside(t-(pi/4)));
        case 4
            x=heaviside(t+1)-heaviside(t-2);
            h=0.25*(heaviside(t+0.75)-heaviside(t-0.75));
            c=dt*conv(x,h,'same');
            c_culc= 0*(heaviside(t+(7/4))) + (1/4*(t+7/4)).*(heaviside(t+(7/4))-heaviside(t+0.25)) + 3/8*(heaviside(t+0.25)-heaviside(t-(5/4))) + (-0.25*t +(11/16)).*(heaviside(t-(5/4))-heaviside(t-(11/4))) + 0*heaviside(t-(11/4));
    end
    l=(1:length(c)).*dt +t(1);
    %disp(c);
    
    figure(i)
    subplot(221), plot(t,x,'r'), title('x impulse response'),
    grid on, xlim([-10 10]), xlabel('t'), ylabel('amp');
    
    subplot(222), plot(t,h,'b'), title('h system input'),
    grid on, xlabel('t'), ylabel('amp');
    
    subplot(223), plot(l,c,'r'), title('x(t)*h(t) system response - convolution(conv)'),
    grid on, xlabel('t'), ylabel('amp');
    
    subplot(224), plot(l,c_culc,'r'), title('x(t)*h(t) system response - convolution(culc)'),
    grid on, xlabel('t'), ylabel('amp');
    
end

clear;
syms t   
sum=0;  
x=pi^2-t^2;  %function you want 
a0=(1/(2*pi/4))*int(x,t,-pi/4,pi/4); 
for n=1:5 
        %finding the coefficients 
    an=(1/(pi/4))*int(x*cos((n*pi*t)/(pi/4)),t,-pi/4,pi/4); 
    bn=(1/(pi/4))*int(x*sin((n*pi*t)/(pi/4)),t,-pi/4,pi/4);    
    sum=sum+(an*cos((n*pi*t)/(pi/4))+bn*sin((n*pi*t)/(pi/4)));  
end 
f_s=sum+(a0/2);
% https://www.instagram.com/koroshkorosh1/
figure(5)
subplot(211)
ezplot(t,x,[-pi/4,pi/4]);
title('function'),
grid on, xlim([-pi/4 pi/4]), xlabel('t'), ylabel('x'); 
hold on; 
subplot(212)
ezplot(t,f_s,[-pi/4,pi/4]), grid on; 
title('fourier series of x'),
xlim([-pi/4 pi/4]), xlabel('t'), ylabel('f_s');


end