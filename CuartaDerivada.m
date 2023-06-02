function [fxCentrada,errorCentrada] = CuartaDerivada(funcionMatematica,h,xi)
clc; 
format long;
syms x;

fM=funcionMatematica; %Función depende de x.
% Convierte de cadena a una función que interprete MATLAB
f=str2func(['@(x)' fM]);


% Aplicación de fórmula de la tercera derivada
fxCentrada = round((-f(xi+3*h)+12*f(xi+2*h)+39*f(xi+h)+56*f(xi)-39*f(xi-h)+12*f(xi-2*h)+f(xi-3*h))/(6*h^(4)),6);

% Mostrar valores
disp(fxCentrada)

% Evaluar
fxD = diff(f,x,3);
fxD1 = inline (fxD,'x');
valor = fxD1(xi);

% Calcular errorese
errorCentrada = round(abs((valor-fxCentrada)/valor)*100,6);

end