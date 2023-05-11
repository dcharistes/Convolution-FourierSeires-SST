clc; clear;
syms T;

t=linspace(-10,10,2000);
x=3/4*heaviside(t+0.25);
h=exp(-0.25*t).*heaviside(t-0.75);
l_x=length(x);
l_h=length(h);
