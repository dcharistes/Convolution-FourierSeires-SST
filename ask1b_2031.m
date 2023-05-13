function ask1b_2031
clear;

syms t   
sum=0;  
x=pi^2-t^2;

a0=(1/(2*pi))*int(x,t,-pi,pi); 
for n=1:10
    an=(1/pi)*int(x*cos((n*pi*t)/pi),t,-pi,pi); 
    bn=(1/pi)*int(x*sin((n*pi*t)/pi),t,-pi,pi);    
    sum=sum+(an*cos((n*pi*t)/pi)+bn*sin((n*pi*t)/pi));  
end 

f_s=sum + a0;
disp(f_s);
figure(5)
subplot(211), 
fplot(t,x,[-pi,pi]), title('function'),
grid on, xlim([-pi pi]), ylim([0 10]), xlabel('t'), ylabel('x'); 
 
subplot(212),
fplot(t,f_s,[-pi,pi]), title('fourier series of x'),
grid on, xlim([-pi pi]), ylim([0 10]), xlabel('t'), ylabel('f_s');

end