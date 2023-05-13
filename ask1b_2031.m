function ask1b_2031
clc;clear;

syms t   
sum=0;  
x=pi^2-t^2;
%f_s=zeros(1,5);
i=1;
a0=(1/(2*pi))*int(x,t,-pi,pi); 
for n=1:10
    an=(1/pi)*int(x*cos((n*pi*t)/pi),t,-pi,pi); 
    bn=(1/pi)*int(x*sin((n*pi*t)/pi),t,-pi,pi);    
    sum=sum+(an*cos((n*pi*t)/pi)+bn*sin((n*pi*t)/pi));
    switch n
        case 1 
            f_s(i)= sum+a0;
            i=i+1;
        case 2
            f_s(i)= sum+a0;
            i=i+1;
        case 3
            f_s(i)= sum+a0;
            i=i+1;
        case 5
            f_s(i)= sum+a0;
            i=i+1;
        case 10
            f_s(i)= sum+a0;
            i=i+1;
    end
end 

%f_s=sum + a0;
disp(f_s);
figure('Name','Initial function')
fplot(t,x,[-pi,pi]), title('function x= π^2 - t^2'),
grid on, xlim([-pi pi]), ylim([0 10]), xlabel('t'), ylabel('x'); 

figure('Name',"Fourier series transformation of x")
for i=1:5
subplot(3,2,i),
fplot(t,f_s(i),[-pi,pi]), title("For n= "+i),
grid on, xlim([-pi pi]), ylim([0 10]), xlabel('t'), ylabel('f_s');

end