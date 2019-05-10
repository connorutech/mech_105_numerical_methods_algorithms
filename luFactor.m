
function [L,U,P] = luFactor(A)
%% Mech 105 Homework 16 LU decomposition algorithm
% Connor Utech
% Date created: 3/27/2019
% last edit: 4/2/2019
%--------------------------------------------------------------------------------------------------------------------------------------------------
% this function performs a L U decomposition while keping track of the 
% pivotting matrix
% what to input into the command window to use the function: 
% [L,U,P]=luFactor(A) this will display L, U, and P
% [L,U]=luFactor(A) this will display L and U
% which ever variable is in the brackets when calling the fucntion, it will
% display that variable as the output.  The lower matrix will be the only
% one displayed if nothing is put before calling the function
% ex: luFactor(A) in the command window will only display the lower matrix.
%% Inputs
% A is a square coefficient matrix
% example of A (if it were a 3x3 matrix)
% 7 5 6
% 9 2 4
% 8 1 3
%% outputs
% L is the lower triagular matrix
% U is the upper triagular matriz
% P is the pivot matrix

[r,c]=size(A); %r stands for row, c for column.  Sets both of theses variables according to the maxtrix size
if r~=c
    error('matrix A must be a square matrix') %checking to make sure that the input matrix is a square matrix
end
% defining the initial L, U, and P matricies
% U is set as A before it is pivoted and elimination has occured. 
U=A;
% L and U are both set to an identity matrix, the dimensions are equal to
% the size of the A matrix input
P=eye(r);
L=eye(r);
% identifying which rows to pivot
for n=1:(r-1)
p=max(abs(U(n:r,n)));
    for i=n:r
        if (abs(U(i,n))==p)
            d=i;
        end
    end
    % this part actually switches the rows of the L and U matricies according to
    % the pivot matrix, so the llargest coefficient will be on top, smallest in the last row.  This is done to avoid dividing by zero and
    % subtractive cancellation errors. Sets the pivot matrix so that [P]*[A]=[L]*[U]  
    P([n,d],:)=P([d,n],:);
    U([n,d],n:r)=U([d,n],n:r);
    L([n,d],1:n-1)=L([d,n],1:n-1);
   
% this calculates the final L and U matricies after they have been pivoted. 
    for l=n+1:r
    L(l,n)=U(l,n)/U(n,n);
    U(l,n:r)=U(l,n:r)-L(l,n)*U(n,n:r);
end 
end
end


