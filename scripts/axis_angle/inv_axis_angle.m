%%Sopravvivenza_AIRO! 
%% Author: Massimo, Miryam, Leonardo, Federico, Francesco

clc
clear all
close all

%% Define Parameters
eps = 10^-10;

%% Inverse Problem

% We generate a 3x3 Rotation Matrix, that after we want to fill
%R = zeros(3,3);

disp("Insert Rotation matrix values")
% Insert numbers of your Rotation Matrix
%for row=(1:3)
%    for col=(1:3)
%        value = input(sprintf("Insert value (%d,%d)", row, col));
%        R(row,col) = value;
%    end
%end

% We print the Matrix for Inverse Problem
R = [0 0 0;
     0 0 0;
     0 0 0;]

disp("\nGiven Rotation Matrix\n")
R

a1 = (R(1,2) - R(2,1))^2;
a2 = (R(1,3) - R(3,1))^2;
a3 = (R(2,3) - R(3,2))^2;
x = sqrt(a1+a2+a3);
y = R(1,1) + R(2,2) + R(3,3) - 1;

theta1 = atan2(x,y)
theta2 = atan2(-x, y)

if (theta1 <= eps && theta1 >=-eps)
    disp ('There is no solution, theta = 0')
    return
end

if isequal(theta, pi)
    disp ('There are only 2 solution, theta = 0')
    R_dir = 2*r*r' - eye(3)

    disp('CHECK THE SIGNS OF THESE COMPONENTS!')

    % CHECK THE SIGNS OF THESE COMPONENTS!

    rx_sing1 = sqrt((R_dir(1,1) + 1)/2);

    ry_sing1 = sqrt((R_dir(2,2) + 1)/2);

    rz_sing1 = sqrt((R_dir(3,3) + 1)/2);

    r_sing1 = [rx_sing1; ry_sing1; rz_sing1]

    rx_sing2 = -sqrt((R_dir(1,1) + 1)/2);

    ry_sing2 = -sqrt((R_dir(2,2) + 1)/2);

    rz_sing2 = -sqrt((R_dir(3,3) + 1)/2);

    r_sing2 = [rx_sing2; ry_sing2; rz_sing2]

end

if sin(theta1) ~= 0
    fprintf("We are in regular case :) because sin(theta1): %f \n", sin(theta1));
    k = 1/(2*sin(theta1));
    r1x = k*(R(3,2) - R(2,3));
    r1y = k*(R(1,3) - R(3,1));
    r1z = k*(R(2,1) - R(1,2));

    fprintf("This is the axir r1: \n")
    r1 = [r1x; r1y; r1z]
    norm_r1 = norm(r1);
    fprintf ("This is the norm of r1: %f \n", norm_r1)
end

if sin(theta2) ~= 0
    fprintf("We are in regular case :) because sin(theta2): %f \n", sin(theta2));
    k = 1/(2*sin(theta2));
    r2x = k*(R(3,2) - R(2,3));
    r2y = k*(R(1,3) - R(3,1));
    r2z = k*(R(2,1) - R(1,2));
    
    fprintf("This is the axir r2: \n")
    r2 = [r2x; r2y; r2z]
    norm_r2 = norm(r2);
    fprintf ("This is the norm of r2: %f \n", norm_r2)
end


