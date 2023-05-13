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
            syms c_culc(t);
            c_culc(t)=piecewise(-10<=t&t<-2, 1/3*(exp(-9/16)-exp(3/2)), -2<=t&t<3/4, 1/3*(2*exp(3/2)+exp(-9/16))-exp(-0.75*t),t>=0.75,2/3*(exp(3/2)-exp(-9/16)));
        case 3
            x=0.75*(heaviside(t+(pi/4))-heaviside(t-(pi/4)));
            h=cos(0.25*t);
            c=dt*conv(x,h,'same');
            c_culc=(-3*(sin(0.25*t-(pi/16))-sin(0.25*t+(pi/16)))).*(heaviside(t+(pi/4))-heaviside(t-(pi/4)));
        case 4
            x=heaviside(t+1)-heaviside(t-2);
            h=0.25*(heaviside(t+0.75)-heaviside(t-0.75));
            c=dt*conv(x,h,'same');
            syms c_culc(t);
            c_culc(t)=piecewise(-10<=t&t<-7/4, 0, -7/4<=t&t<-1/4, 1/4*(t+7/4), -1/4<=t&t<5/4, 3/8, 5/4<=t&t<11/4, -0.25*t +(11/16), 11/4<=t&t<=10);
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
    
    subplot(224) 
    if i==2 || i==4
        fplot(c_culc);
    else
        plot(l,c_culc,'r');
    end

    title('x(t)*h(t) system response - convolution'),
    grid on, xlabel('t'), ylabel('amp');
    
end
end