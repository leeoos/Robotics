%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

% Symbolic formulas are not functions! Once they have symbolic form, 
% any symbolic variables in them are not substituted with numeric values unless you use subs() 
%to tell it to do the substitutions.

clc
clear all
close all

%% Define Parameters
eps = 10^-10; % lowerbound

%% Define Symbols
syms r11 r12 r13 r21 r22 r23 r31 r32 r33

% Define symbolic matrix
Sym = [   r11 r12 r13;
          r21 r22 r23;
          r31 r32 r33;
      ];

% Define value matrix
R = [   0 0 0;
        0 0 0;
        0 0 0;
    ];

%% Insert Symbolic matrix components 
for row=(1:3)
    for col=(1:3)
        value = input("Insert value:") 
        R(row,col) = value
        Sym(row,col) = value
    end
end

%% IMPORTANT: change values !!!!

% Variable for find theta 
v_t1 = R(1,3)
v_t2 = R(2,3)
v_t3 = R(3,3)

%Variables for find phi
v_f1 = R(3,1)
v_f2 = R(3,2)

%Variables for find xi
v_xi1 = R(1,3)
v_xi2 = - R(2,3)


% Theta >>> 2 Solution
theta1 = (atan2( sqrt(v_t1^2 +v_t2^2), v_t3))
theta2 = (atan2( -sqrt(v_t1^2 + v_t2^2), v_t3))


%  Singular case with theta: 0 pi or -pi >>> No solution
if ((theta1 <= eps && theta1 >= -eps) || (isequal(theta1,+pi)  || isequal(theta1,-pi)))
    fprintf("Only phi + psi or phi = psi")
    %TODO : find psi and phi

% Regular case >>> 2 Solution
else
    fprintf("Regular case with Theta1: " + theta1 + " Theta2: " + theta2)
    % Psi >>> 2 Solution
    psi1 = atan2( v_f1/sin(theta1), v_f2/sin(theta1))
    psi2 = atan2( v_f1/sin(theta2), v_f2/sin(theta2))

    % Phi >>> 2 Solution
    phi1 = atan2( v_xi1/sin(theta1), v_xi2/sin(theta1))
    phi2 = atan2( v_xi1/sin(theta2), v_xi2/sin(theta2))
end


%% Solution vectros: write in the correct order
sol1 = [phi1 theta1 psi1] 

sol2 = [phi2 theta2 psi2]

