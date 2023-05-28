function ask1b_2031
clc;clear;

syms t;   
x=pi^2-t^2;
a0_c=2*(pi^2)/3;
sum_c=0;
l=1;
for n=1:10
    sum_c=sum_c + ((-4/n^2)*(-1)^n)*cos(n*t);
    switch n
        case 1 
            f_s_c(l)= sum_c+a0_c;
            l=l+1;
        case 2
            f_s_c(l)= sum_c+a0_c;
            l=l+1;
        case 3
            f_s_c(l)= sum_c+a0_c;
            l=l+1;
        case 5
            f_s_c(l)= sum_c+a0_c;
            l=l+1;
        case 10
            f_s_c(l)= sum_c+a0_c;
            l=l+1;
    end
end
figure('Name','Initial function')
fplot(t,x,[-pi,pi]), title('function x= π^2 - t^2'),
grid on, xlim([-pi pi]), ylim([0 10]), xlabel('t'), ylabel('x'); 

figure('Name',"Fourier series transformation of x")
for l=1:5
subplot(3,2,l),
fplot(t,x,[-pi,pi]), hold on;
fplot(t,f_s_c(l),[-pi,pi]), title("For n= "+l),
grid on, xlim([-pi pi]), ylim([0 10]), xlabel('t'), ylabel('f_s'),legend('x','f_s');
end

end