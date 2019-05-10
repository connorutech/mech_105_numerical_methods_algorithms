%% False Position Algorithm Development (Homework 11)
% Connor Utech 
% date created: 2/27/2019  finished on 3/3/2019
%% inputs 
%func is the actual function
%xl is a lower bound guess
%xu is a upper bound guess
%es is the desired relative error, the default is 0.0001 percent 
%maxiter is the desired number of maximum iterations, the default is 200 interations
%% outputs
% Xr is the root of the function
% fx is the function evaluated at the root
% ea is the approximate relative error
% inter is how many iterations were performed
clear
clc
format long
iter=0;
Xr=xl;
ea=100;
% input 
function [Xr,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)

if nargin==4
    maxiter=200;
elseif nargin==3
    es=0.0001;
    maxiter=200;
elseif nargin<3
    error('there must be at least 3 inputs')
end
if (func(xl)/func(xu))>0
    error('there must be a sign change within the bounds guessed')
end
while (1)
    xrold=Xr;
    Xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    iter=iter+1;
    if Xr~=0
        ea=abs((Xr-xrold)/Xr)*100;
    end
    sign_test=func(xl)*func(Xr);
    if sign_test<0
        xu=Xr;
    elseif sign_test>0
        xl=Xr;
    else
        ea=0;
    end
if ea==es
    break
elseif iter==maxiter
    break
end
end
fx=func(Xr);
end
