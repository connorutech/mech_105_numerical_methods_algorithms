function[I]=Simpson(x,y)
%% Mech 105 Homework 19 
% Connor Utech 
% Date created: 4/15/2019 Last edited: 4/18/2019
% The purpose if this function is to estimate a integral using a
% combination of the composite Simpson's 1/3 rule and the trapizoidal method.
% it decides how to use the rules based on whether the number of intervals
% is odd or even.  If there are a even number of intervals, the function
% will use composite Simpson's 1/3 rule for every interval except the last one, 
% and the trapizoidal rule will be used on the last interval.  Then those 
% values will be added to give the total interval. If there are an odd
% number of intervals the function will only use the composite simpson's
% 1/3 rule.  
%% Function[I]=Simpson(x,y)
% the input should look like Simpson(x,y)
% where x is a evenly spaced vector and y is a set of data that is
% dependent on x.
% if x is not evenly spaced then the function will return a error saying
% the x vector must be evenly spaced
% the x and y vectors must also have the same number of elements or the
% function will return a error.  
d=diff(x);% finds the spece between the x vector values
n=length(x); % determines the number of inputs by finding the length of the x vector
D=sum(diff(d)); % this is the sum of the difference of the difference of d.  This dinds the space between each x input value to make sure that the x vector is evenly spaced
Tolerance=(2.2204*exp(1)^-16)*1000; % sets the tolerance for the difference between vales of the x vector
if nargin~=2
    error('there must be a x and y input')
end
if length(x)~= length(y) 
    error('the input vectors must be the same length')
end % gives a error if the x and y vectors do not have the same number of elements
if D>Tolerance
    error('x vector must be equally spaced')
end % produces a error if the difference of the difference is greater than the machine epsilon value * 1000
if sum(D)==0 % makes sure the x vector is equally spaced before moving on to the calculations 
    if rem(length(x),2)~=0 % makes the function go through simpson's 1/3 if the number of intervals is odd 
        I=((x(n)-x(1))/(3*(n-1)))*((y(1))+(4*(sum(y(2:2:n)))+(2*sum(y(3:2:n-2)))+y(n))); % simpson's 1/3 rule execution
            elseif rem(n,2)==0 % if there are a even  number of intervals the function goes through simpson's 1/3 rule and then the trapizoidal rule for the last interval
                warning('trapizoidal rule must be used for the last interval')% warns user that the trapizoidal rule has to be used 
                I_1=((x(n-1)-x(1))/(3*(n-2)))*((y(1))+(4*(sum(y(2:2:n-1)))+(2*sum(y(3:2:n-3)))+y(n-1))); % composite simpson's 1/3 rule up to the last interval
                I_2=(((x(n)-x(n-1)))/2)*(((y(n-1))+(y(n)))); % trapizoidal rule on the last interval
                I=I_1+I_2; % adds the simpson's 1/3 rule and trapizoidal rule integrals to get the total value of the integral         
    end
end
end