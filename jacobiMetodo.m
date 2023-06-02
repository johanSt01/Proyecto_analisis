function jacobiMetodo(A,b,x,error,m)
clc;
% A = coeficioentes del sistema
% b = coeficientes independientes
% x = aproximación incial
% error = el error dado
% m = numero maximo de iteraciones 

n=length(x);% estable la cantidad de variables que tiene el sistema 
for k=1:m
%Hacemos Matrices para mostrar en las tablas

   x2=x; %calcular el error

 for i=1:n
    
    s=A(i,1:i-1)*x2(1:i-1)+A(i,i+1:n)*x2(i+1:n);% sumatoria de la formula
    x(i)=(b(i)-s)/A(i,i);
    
 end
 if norm(x2-x,inf)<error  %condicional para el numero de iteraciones, el error debe ser menor 
 return                % a la tolerancia dada para que culmine el ciclo
 end
 fprintf('\n la solucion del sistema en la iteracion %4.0f\n',k)
 for i=1:n

    fprintf(' x(%1.0f)=%5f\n',i,x(i))
 end
end
 
