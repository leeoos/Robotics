%%Sopravvivenza_AIRO! 
%% Author: Massimo, Miryam, Leonardo, Federico, Francesco

clc
clear all
close all

%% Define Parameters
eps = 10^-10;

%% Inverse Problem

% Rotation matrix for the inverse problem
disp("Given Rotation Matrix")
R = [-2/3 2/3 -1/3;
     2/3 1/3 -2/3;
     -1/3 -2/3 -2/3;];
R

% Definition of the args for atan2
a1 = (R(1,2) - R(2,1))^2;
a2 = (R(1,3) - R(3,1))^2;
a3 = (R(2,3) - R(3,2))^2;
x = sqrt(a1+a2+a3);
y = R(1,1) + R(2,2) + R(3,3) - 1;

theta1 = atan2(x,y)
theta2 = atan2(-x, y)

if (theta1 <= eps && theta1 >=-eps)
    disp ('There is no solution, theta = 0')
    exit

elseif isequal(theta1, pi) % or theta2 = -pi
    disp ('There are only 2 solution, theta = pi')

    disp('CHECK THE SIGNS OF THESE COMPONENTS!')

    % CHECK THE SIGNS OF THESE COMPONENTS!

    rx_sing1 = sqrt((R(1,1) + 1)/2);

    ry_sing1 = sqrt((R(2,2) + 1)/2);

    rz_sing1 = sqrt((R(3,3) + 1)/2);

    r = [rx_sing1; ry_sing1; rz_sing1];
    r_amb = [   strcat(char(177), string(rx_sing1)); 
                strcat(char(177), string(ry_sing1)); 
                strcat(char(177), string(rz_sing1));]

else % sin(theta1) ~= 0 and sin(theta2) ~= 0

    fprintf("We are in regular case :) because sin(theta1): %f sin(theta2): %f \n", sin(theta1), sin(theta2));
    k = 1/(2*sin(theta1));
    r1x = k*(R(3,2) - R(2,3));
    r1y = k*(R(1,3) - R(3,1));
    r1z = k*(R(2,1) - R(1,2));

    fprintf("This is the axir r1: \n")
    r1 = [r1x; r1y; r1z]
    norm_r1 = norm(r1);
    fprintf ("This is the norm of r1: %f \n", norm_r1)

    k = 1/(2*sin(theta2));
    r2x = k*(R(3,2) - R(2,3));
    r2y = k*(R(1,3) - R(3,1));
    r2z = k*(R(2,1) - R(1,2));
    
    fprintf("This is the axir r2: \n")
    r2 = [r2x; r2y; r2z]
    norm_r2 = norm(r2);
    fprintf ("This is the norm of r2: %f \n", norm_r2)
end


