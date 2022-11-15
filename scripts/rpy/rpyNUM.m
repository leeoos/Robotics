%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

% This script is useful to solve direct and invers rpy problems:
% Diret Problem: 
%   - the script compute a composition of three rotation matrix
%     of given angles around fixed axes (XYZ). In order for the script to
%     work properly it is useful to specify the angles names in the symbol 
%     inizialization list. The script take as input for each rotation the rotation 
%     axis. The output is the pre multiplication of all rotation matrices.
%
%Invers Problem:

clc
clear all
close all

%% Direct Problem

% IMPORTANT: change in the list of simbols and in the array of angles
% the names of the angles with the name given by the problem 
syms alpha1 alpha2 alpha3  
%syms psi theta phi

angles =   [     
            -pi/2
            -pi/4
             pi/4
           ]

%angles =   [   
%            psi
%            theta
%            phi
%           ]

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
    Res = R * Res; %% Roll Pitch Yaw 
end

% Final result (composition of all rotation)
disp("Final Matrix: rotation composition ")
Res