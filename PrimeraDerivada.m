function [fxCentrada,errorCentrada] = PrimeraDerivada(funcionMatematica,h,xi)
clc;
format long;
syms x;

fM=funcionMatematica; %Función depende de x.
f=str2func(['@(x)' fM]);

fxCentrada = round((-f(xi+2*h)+8*f(xi+h)-8*f(xi-h)+f(xi-2*h))/(12*h),6);

disp(fxCentrada)

fxD = diff(f,x,1);
fxD1 = inline (fxD,'x');
valor = fxD1(xi);

errorCentrada = round(abs((valor-fxCentrada)/valor)*100,6);
end