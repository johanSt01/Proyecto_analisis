function [valor,valorReal,errorReal] = trapecioMultiple(funcionMatematica,a,b,n)
clc; format long ;syms x;
fa =  funcionMatematica;
% Convierte de cadena a una función que interprete MATLAB
fun=str2func(['@(x)' fa]);
% Convierte las cadenas a valores numéricos que interprete MATLAB
a = str2num(a);
b = str2num(b);
n = str2num(n);
valorReal = double(round(int(fun,x,[a b]),6))
h = round((b-a)/n,6);
i = 0;
total = (b -a)/(2*n);
totalFx = 0;
% Mientras el contador sea menor o igual al n
while i<=n

    xn = a + h*i;
    fx = fun(xn);
    if(i==0)
   
        totalFx = totalFx + fx;

    end

    if(i==n)

        totalFx = totalFx  + fx;

    end

    if (i>0 && i<n)

        totalFx = totalFx + 2*fx;

    end

    i = i+1;
end
valor = round(total *totalFx,6)

% Error
errorReal = round(abs((valorReal - valor)/valorReal)*100,6)

% Se evalúa
fx2 = diff(fun,x,2);
fx3 = round((int(fx2,x,[b a]))/(b-a),6);
end