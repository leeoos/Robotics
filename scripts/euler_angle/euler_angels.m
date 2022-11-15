%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

% This script is useful to solve dirct and innvers euler angles problems:
% Diret Problem: 
%   - the script compute a composition of three rotation matrix
%     of given angles around moving axes (XYZ). In order for the script to
%     work properly it is useful to specify the angles names in the symbol 
%     inization list. The script take as input for each rotation the rotation 
%     axis. The output is the post multiplication of all rotation matrices.
%
%Invers Problem:

clc
clear all
close all

%% Direct Problem

% IMPORTANT: change in the list of simbols and in the array of angles
% the names of the angles with the name given by the problem
syms phi theta psi

angles =   [   
            phi 
            theta
            psi
           ]

% Accumulator matrix for the product, inizialized as I 3x3 
Res = eye(3);

sprintf("\n Define the sqequence of rotation axes \n")

% Note: this code is not 'safe' double check the input 
% to be sure of the result
for i=(1:3)
    % This loop genarate the proper R matrix for each angle in angles
    % according to the given axis of rotation taken as input

    axis = input('Insert an axis of rotation (x, y, z): ', 's');

    if isequal(axis, 'x')
        R = [   1       0                   0;
                0 cos(angles(i))            -sin(angles(i));
                0 sin(angles(i))            cos(angles(i));
            ];

    elseif isequal(axis, 'y')
        R = [   cos(angles(i))      0       sin(angles(i));
                0                   1       0;
                -sin(angles(i))     0       cos(angles(i));
            ];

    elseif isequal(axis, 'z')
        R = [   cos(angles(i))      -sin(angles(i))     0;
                sin(angles(i))      cos(angles(i))      0;
                     0              0                   1;
            ];
    else
        disp("Invalid Input")
        return
    end

    % Perform the matrix multiplication in a fixed order 
    % Res will contain the composition of rotation at each step
    Res = Res * R;
end

% Final result (composition of all rotation)
disp("Final Matrix: rotation composition ")
Res

%% Inverse Problem

% Inizializing a rotation matrix to be filled
R=eye(3);

disp("Insert Rotation matrix values")
%% Insert rotation matrix components 
for row=(1:3)
    for col=(1:3)
        value = input(sprintf("Insert value (%d,%d):", row, col));
        R(row,col) = value;
    end
end

disp("\nGiven Rotation Matrix\n")
R

disp("Insert atan2 args for theta1")
xT1 = input('arg1: ')
yT1 = input('arg2: ')
theta1 = atan2(xT1, yT1)

disp("Insert atan2 args for theta2")
xT2 = input('arg1: ')
yT2 = input('arg2: ')
theta2 = atan2(xT2, yT2)

disp("Insert atan2 args for phi1")
xF1 = input('arg1: ')
yF1 = input('arg2: ')
phi1 = atan2(xF1, yF1)

disp("Insert atan2 args for phi2 \n")
xF2 = input('arg1: ')
yF2 = input('arg2: ')
phi2 = atan2(xF2, yF2)

disp("Insert atan2 args for psi1 \n")
xP1 = input('arg1: ')
yP1 = input('arg2: ')
psi1 = atan2(xP1, yP1)

disp("Insert atan2 args for psi2 \n")
xP2 = input('arg1: ')
yP2 = input('arg2: ')
psi2 = atan2(xP2, yP2)

disp("First sequence: \n")
[phi1, theta1, psi1]

disp("Sequence sequence: \n")
[phi2, theta2, psi2]

