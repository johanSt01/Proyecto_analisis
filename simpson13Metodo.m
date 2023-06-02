function [valor,valorReal,errorReal] = simpson13(funcionMatematica,a,b,n)
clc; format long ;syms x;
fa =  funcionMatematica;
% Convierte de cadena a una función que interprete MATLAB
fun=str2func(['@(x)' fa]);
% Convierte de cadena a un valor numérico que interprete MATLAB
a = str2num(a);
b = str2num(b);
n = str2num(n);
valorReal = double(round(int(fun,x,[a b]),6))
h = round((b-a)/n,6);
i = 0;
total = (h)/(3);
totalFx = 0;
% Mientras el contador sea menor o igual a n (ingresado)
while i<=n

    xn = a + h*i;
    fx = fun(xn);
    if(i==0)
   
        totalFx = totalFx + fx;

    end

    if(i==n)

        totalFx = totalFx  + fx;

    end

    if(mod( i , 2 )==0 && i<n && i>0)

        totalFx = totalFx  + 2*fx;

    else
        if(mod( i , 2 )~=0 && i<n && i>0)

        totalFx = totalFx + 4*fx;
        end
    end
    
    i = i+1;
  
end

% Errores
valor = round(total *totalFx,6)

errorReal = round(abs((valorReal - valor)/valorReal)*100,6)

end