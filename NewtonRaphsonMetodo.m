function [M2,A,M4,f] = NewtonRaphsonMetodo(funcion,valorInicial,criterioParada)
clc; format long;syms x;

Fx=funcion; %Función 
% Convierte de cadena una función manejable
f=str2func(['@(x)' Fx]);
derivadaFx= diff(f,x,1);    %Derivada de la función
fp = inline (derivadaFx,'x'); %nos permite crear en la misma ventana de comandos, una corta función que puede ser llamada de forma repetida

i = 0;
% Convierte la cadena a un valor numérico que interprete MATLAB
xi = str2num(valorInicial);             %Condicion Inicial
xii = 0;            %xi + 1

eA = 100;
% Convierte de cadena a un valor numérico que interprete MATLAB
criterioDeParada = str2num(criterioParada);

% Muestra el valor de la variable sin imprimir el nombre de esta
disp(xi)

% Mientras el error ingresado sea menor al absoluto
while criterioDeParada < eA
    
    xii =  round((xi-(f(xi)/fp(xi))),6); 
   
    %f(xi) es la funcion evaluada en xi
    fxi = f(xi); 
    fxi = round(fxi,6);
    %Aproximamos la raiz con la fórmula
    fpxi = round(fp(xi),6);
    
    i = i+1;
    %Matrices para las tablas
    A(i) = [xi];
    M4(i)=[fxi];
    if(i==1)
     M2(1:6) = num2cell([i,xii,xi,fxi,fpxi,0]);
    end
     
    if(i>1)
        eA = abs(((abs(xii)-abs(xiir))/xii)*100);
        M3=num2cell([i,xii,xi,fxi,fpxi,eA]);
        M2 = [M2;M3];
        
    end

     if(xii > 0)
        xi = xii;
     end
     xiir = xii;
end
