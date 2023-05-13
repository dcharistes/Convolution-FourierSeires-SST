function ask1b_2031
clear;

syms t   
sum=0;  
x=pi^2-t^2;

a0=(1/(2*pi/4))*int(x,t,-pi/4,pi/4); 
for n=1:5  
    an=(1/(pi/4))*int(x*cos((n*pi*t)/(pi/4)),t,-pi/4,pi/4); 
    bn=(1/(pi/4))*int(x*sin((n*pi*t)/(pi/4)),t,-pi/4,pi/4);    
    sum=sum+(an*cos((n*pi*t)/(pi/4))+bn*sin((n*pi*t)/(pi/4)));  
end 

f_s=sum + a0;

figure(5)
subplot(211), 
ezplot(t,x,[-pi/4,pi/4]), title('function'),
grid on, xlim([-pi/4 pi/4]), xlabel('t'), ylabel('x'); 
 
subplot(212),
ezplot(t,f_s,[-pi/4,pi/4]), title('fourier series of x'),
grid on, xlim([-pi/4 pi/4]), xlabel('t'), ylabel('f_s');

end