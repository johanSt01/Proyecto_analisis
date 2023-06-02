function [M2,x,A,B,f] = FalsaPosicionMetodo(funcion,xi,xs,criterioParada)
%clc para borrar 
%format el formato en el que se mostraran los datos
clc; format long;
fa=funcion; %Función depende de x.
%str2num sirve para cambiar de string a una funcion entendible por matlab
f=str2func(['@(x)' fa]);
%str2num sirve para cambiar de string a un numero entendible por matlab
xi = str2num(xi);
xs = str2num(xs);
xr = xs - (f(xs)*(xs-xi))/(f(xs)-f(xi));
%anterior xr para calcular el error 
fxi = 0;
fxr = 0;
fxs = 0;
i = 0;
eA = 100;

error = str2num(criterioParada);



while error < eA
    xrAnterior =xr;
    xr = xs - (f(xs)*(xs-xi))/(f(xs)-f(xi));
    %redondea el numero de decimales
    xr = round(xr,6);
    fxi = f(xi);
  
    fxi = round(fxi,6);
    fxr = f(xr);
  
    fxr = round(fxr,6);
    fxs = f(xs);
    
    fxs = round(fxs,6);
    i = i+1;
  
     if(i>1)
        
        eA = ((xr -xrAnterior)/xr)*100;
        eA = round(eA,6);
        %agrega los datos a una tabla
        M3=num2cell([i,xi,xr,xs,fxi,fxr,fxs,eA]);
        %se une la tabla M2 Y M3
        %Esto es para que cada iteración se una a la tabla
        M2 = [M2;M3];
   
     end

     if(i==1)
     %se agregan titulos a las columnas de las tablas
     M2(1:8)= num2cell([i,xi,xr,xs,fxi,fxr,fxs,-1]);
    
     end
     
     A(i) = [xr];
     B(i) = [fxr];
    %Definir cual es el proximo xs de acuerdo al cambio de signo
    if fxi > 0
        if(fxr < 0)
            xs = xr;
        end
    end

    if fxi < 0
        if(fxr > 0)
            xs = xr;
        end
    end

     if fxr > 0
        if(fxs < 0)
            xi = xr;
        end
     end

    if fxr < 0
        if(fxs > 0)
            xi = xr;
        end
    end    
end