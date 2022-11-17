%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

% This script is useful to solve direct and invers euler angles problems:
% Diret Problem: 
%   - the script compute a composition of n rotation matrix
%     of given angles around moving axes (XYZ). In order for the script to
%     work properly it is useful to specify the angles names in the symbol 
%     inizialization list. The script take as input for each rotation the rotation 
%     axis. The output is the post multiplication of all rotation matrices.
%
%Invers Problem:

clc
clear all
close all

%% Direct Problem

% IMPORTANT: change in the list of simbols and in the array of angles
% the names of the angles with the name given by the problem
syms alpha1 alpha2 alpha3  
%syms phi theta psi

angles =   [   
            alpha1
            alpha2
            alpha3
           ]

%angles =   [   
%            phi
%            theta
%            psi
%           ]

% Accumulator matrix for the product, inizialized as I 3x3 
Res = eye(3);

num_of_rotation = input('How many rotation: ');

disp(" Define the sqequence of rotation axes ")

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

goon = 0;
goon = input(sprintf("Continue with inverse problem? "), 's');
if (isequal(goon, 's') || isequal(goon, 'si') || isequal(goon, 'y') || isequal(goon, 'yes'))
    alpha1 = input('Insert aplha1')
    alpha2 = input('Insert aplha2')
    alpha3 = input('Insert aplha3')
    subs(Res)
end

goon = 0;
goon = input(sprintf("Continue with inverse problem? "), 's');
if isequal(goon, 'n') || isequal(goon, 'no')
    return
end

%% Inverse Problem

% Inizializing a rotation matrix to be filled
% R=eye(3);

disp("Insert Rotation matrix values")
%% Insert rotation matrix components 
%for row=(1:3)
%    for col=(1:3)
%        value = input(sprintf("Insert value (%d,%d):", row, col));
%        R(row,col) = value;
%    end
%end
%

R = [ 0  0  0;
      0  0  0;
      0  0  0;]

disp("\nGiven Rotation Matrix\n")
R

disp("Args for the first angle")
x_first = input('arg1: ')
yT1 = input('arg2: ')
first = atan2(x_first, yT1)

disp("Args for the first angle bis")
xT2 = input('arg1: ')
yT2 = input('arg2: ')
first_bis = atan2(xT2, yT2)

disp("Args for the second angle")
xF1 = input('arg1: ')
yF1 = input('arg2: ')
second = atan2(xF1, yF1)

disp("Args for the second angle bis")
xF2 = input('arg1: ')
yF2 = input('arg2: ')
second_bis = atan2(xF2, yF2)

disp("Args for the third angle")
xP1 = input('arg1: ')
yP1 = input('arg2: ')
third = atan2(xP1, yP1)

disp("Args for the third angle bis")
xP2 = input('arg1: ')
yP2 = input('arg2: ')
third_bis = atan2(xP2, yP2)

disp("First sequence: \n")
[first, second, third]

disp("Sequence sequence: \n")
[first_bis, second_bis, third_bis]

