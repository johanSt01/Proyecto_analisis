function [M2,A,M4,fx] = puntoFijoMetodo(funcionFx,funcionGx,valorInicial,criterioParada)
%referenciar a matlab sobre que variable operar 
clc; format long;syms x;

%Introducimos la función,el punto de inicio,así como
%porcentaje de error
f =funcionFx;
fx=str2func(['@(x)' f]);
g =funcionGx ;
gx =str2func(['@(x)' g]) ;
xi =str2num(valorInicial);
j = 0;
criterioDeParada = str2num(criterioParada);
%deriva la gx a partir de x una vez
derivadaGx= diff(gx,x,1);
%convierte la funcion ingresada a una funcion entendible a matlab
gxD = inline (derivadaGx,'x');

%Se muestra la función

disp((xi))
if gxD(xi)<1
eA = 100;

while criterioDeParada < eA
%Aproximamos la raiz con la fórmula correspondiente
fxi=round(fx(xi),6);
fgx=round(gx(xi),6);

j=j+1;

%Hacemos Matrices para mostrar en las tablas
A(j) = [xi];
M4(j)=[fxi];
if(j==1)
    
    M2(1:5)= num2cell([j,xi,fgx,fxi,0]);
end
if(j>1)
  
    %calcula el error
 eA=round(abs(((abs(fgx)-abs(xi))/fgx)*100),6);

 M3=num2cell([j,xi,fgx,fxi,eA]);
 %Esto es para que cada iteración se una a la tabla
 M2 = [M2;M3];
end
xi=fgx;

end
end
if gxD(xi)>1
   
    mensaje = 'Ingrese otro gx, ' ; 
    mensaje = strcat(mensaje,g);
    mensaje =  strcat(mensaje,' diverge ');
 
  f = warndlg(mensaje,'alerta');
  M2 = ([0,0,0,0,0]);
  A = 0;
  M4 = 0;
  fx = 0;

end
end