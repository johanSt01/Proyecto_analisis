function [M2,x,A,B,f] = BiseccionMetodo(funcion,xi,xs,error)
clc;
format long;
%format long sirve para desplegar resultados con 14 cifras decimales.

fa=funcion; %Función depende de x
f=str2func(['@(x)' fa]);%str2func es un identificador de funcion 

i = 0;
xr = (xi + xs)/2;
fxi = 0;
fxr = 0;
fxs = 0;
eA = 100;
criterioDeParada = error;

% Mientras el error ingresado sea menor al absoluto
while criterioDeParada < eA
    
    xr1 = xr;
    xr  = (xi+xs)/2; round(xr,6); 
    fxi = f(xi); round(fxi,6);
    fxr = f(xr); round(fxr,6);
    fxs = f(xs); round(fxs,6);
    i = i+1;

     if(i==1)
      M2(1:8)= num2cell([i,xi,xr,xs,fxi,fxr,fxs,0]);
      x = [xi,xs];
    end
     
    if(i > 1)
      
        eA = abs(((xr - xr1)/xr)*100);
        eA = round(eA,7);
        M3(1:8)= num2cell([i,xi,xr,xs,fxi,fxr,fxs,eA]);
        M2 = [M2;M3];
        
    end
    
     A(i) = [xr];
     B(i) = [fxr];

    if (fxi < 0 && fxr > 0 ) 
            xs = xr;   
    end
    if(fxi > 0 && fxr < 0)
            xs = xr;
    end
    if(fxr < 0 && fxs > 0)
            xi = xr;
    end
    if(fxr > 0 && fxs < 0)
            xi = xr;
    end

end
