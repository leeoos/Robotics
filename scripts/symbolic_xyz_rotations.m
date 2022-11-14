%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

% This script compute the composition of three rotation matrix
% of given angles around specific axes (XYZ). In order for the script to
% work properly it is necessary to specify the angles names in the symbol 
% inizialization list.
% The script take as input for each rotation the rotation axis. The output is the post
% multiplication of all rotation matrices

clc
clear all
close all

%% Define Symbols

% IMPORTANT: change in the list of simbols and in the array of angles
% the names of the angles with the name given by the problem
syms alpha1 alpha2 alpha3

angles =   [   
            alpha1
            alpha2
            alpha3
           ]


% Accumulator matrix for the product, inizialized as I 3x3 
Res = eye(3);

% Note: this code is not 'safe' double check the input 
% to be sure of the result
for i=(1:num_of_rotation)
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

    else % isequal(axis, 'z')
        R = [   cos(angles(i))      -sin(angles(i))     0;
                sin(angles(i))      cos(angles(i))      0;
                     0              0                   1;
            ];
    end

    % Perform the matrix multiplication in a fixed order 
    % Res will contain the composition of rotation at each step
    Res = Res * R;
end

% Final result (composition of all rotation)
Res
