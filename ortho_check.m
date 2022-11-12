%%Sopravvivenza_AIRO! 
%% Author: Massimo, Miryam, Leonardo, Federico, Francesco

clc
clear all
close all

%% Definition of parameters

eps = 10^-15; %Smallest Tolerance
rad3 = sqrt(3);
rad6= sqrt(6);
rad2 = sqrt(2);

%%
%%Define Rotation Matrix

disp('This is the Rotation Matrix: ')
R = [ 1/rad3, 1/rad3,  1/rad3;
       1/rad6, -2/rad6, 1/rad6;
       1/rad2,    0   , -1/rad2]

                                
% R = [ 1/rad3, 1/rad3,   1/rad3;
%        1/rad6, -2/rad6,  1/rad6;
%        -1/rad2,    0   , 1/rad2]

% R = [ 1/rad3, 1/rad3,  1/rad3;
%        1/rad6, -2/rad6, 1/rad6;
%        1/rad2,    0   , 1/rad2]

%% Robust Check for Rotation Matrix :) (Fede suca)

detR = det(R);
RT = transpose(R);
norm(RT*R - eye(3),1)

if norm(RT*R - eye(3),1) <= eps
    if abs(detR - 1) <= eps
        disp('R is an element of SO(3)')
 
    else
        fprintf("R is orthonormal, but det = " + detR + "\n")
    end
    
else
    disp('R is not orthonormal')
end

% A = [2, 2; 2, 1] %%
% norm(A,1)
% 
% norm(A, "inf")
% sqrt(13)
% 
% norm(A,2)
% res = 0;
% for i=(1:2) 
%     for j=(1:2)
%         res = res + (A(i,j))^2;
%     end
% end 
% sqrt(res)







