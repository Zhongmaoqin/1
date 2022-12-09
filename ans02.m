clear,clc
g = @(x) fun(x);

x0 = 1.98;
tol = 1e-2;
maxIter = 3;
xRoot = fixPoint(g,x0,tol,maxIter);
fprintf('One of the localized roots is:%d\n',xRoot);
syms x
fx = ((1-x^3*(cos(0.5*x+5/2)^2)+50-x^3*(sin(0.5*x+5/2)^2)-102*(sin(0.5*x+5/2)^2))/4)^(1/3);
if (abs(double(subs(fx,xRoot))-xRoot)-tol)<0
    fprintf('accuracy ε<= 10^-2\n');
else
    fprintf('accuracy ε> 10^-2\n');
end
function xRoot = fixPoint(fun,x0,tol,maxIter)
    for k=1:maxIter
        x=fun(x0);
        if(abs(x-x0)<tol)
            break;
        end
        x0=x;
    end
    xRoot = x;
end 
function gx = fun(x)
    gx =((1-x^3*(cos(0.5*x+5/2)^2)+50-x^3*(sin(0.5*x+5/2)^2)-102*(sin(0.5*x+5/2)^2))/4)^(1/3);
end

