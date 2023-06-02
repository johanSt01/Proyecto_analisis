function [fxCentrada,errorCentrada] = TerceraDerivada(funcionMatematica,h,xi)
clc; 
format long;
syms x;

fM=funcionMatematica; %Función depende de x.
% Convierte de cadena a una función que interprete MATLAB
f=str2func(['@(x)' fM]);


% Aplicación de fórmula de la tercera derivada
fxCentrada = round((-f(xi+3*h)+8*f(xi+2*h)-13*f(xi+h)+13*f(xi-h)-8*f(xi-2*h)+f(xi-3*h))/(8*h^(3)),6);

% Mostrar valores
disp(fxCentrada)

% Evaluar
fxD = diff(f,x,3);
fxD1 = inline (fxD,'x');
valor = fxD1(xi);

% Calcular errorese
errorCentrada = round(abs((valor-fxCentrada)/valor)*100,6);

end