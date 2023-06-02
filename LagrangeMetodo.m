function p=LagrangeMetodo(x,y)
syms t;
n=length(x);
%para darle tamaño al vector
p=0;

for i=1:n
    L=1;
    for j=1:n
        if i~=j
            L=L*(t-x(j))/(x(i)-x(j));
        end
    end
    p=p+L*y(i);
end
p=expand(p);
%para expandir la expresion algebraica 