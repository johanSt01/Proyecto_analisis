function [fxCentrada,errorCentrada] = SegundaDerivada(funcionMatematica,h,xi)

clc; 
format long;
syms x;

fM=funcionMatematica; %Función depende de x.
% Convierte de cadena a una función que interprete MATLAB
f=str2func(['@(x)' fM]);


% Fórmulas segunda derivada redondeadas
fxCentrada = round((-f(xi+2*h)+16*f(xi+h)-30*f(xi)+16*f(xi-h)-f(xi-2*h))/(12*h^(2)),6);

% Mostrar valores
disp(fxCentrada)

fxD = diff(f,x,2);
% Para que MATLAB interprete la función
fxD1 = inline (fxD,'x');
% valor de la función evaluada en Xi
valor = fxD1(xi);

% Se calculan los errores
errorCentrada = round(abs((valor-fxCentrada)/valor)*100,6);

end