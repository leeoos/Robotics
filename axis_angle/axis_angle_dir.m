%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco

clc
clear all
close all

%% Output File
fileID = fopen('output.txt', 'a');

%% Define Parameters
eps = 10^-10;

%% Define Symbols
syms rx ry rz theta

%% Symbolic rotation vector and angles values
rx = input("Insert rx ")
ry = input("Insert ry ")
rz = input("Insert rz ")
theta = input("Insert theta: ")

% TEST VALUES
%rx = 0;
%ry= sqrt((-1/sqrt(2) + 1)/2);
%rz= sqrt((1/sqrt(2) + 1)/2);
%theta = pi;
% END TEST VALUES

%% Direct Problem

% Rotation vector, sin and cos of theta
r = [rx; ry; rz]
s_theta = sin(theta)
c_theta = cos(theta)

%  Singular case with theta: 0 >>> No solution
if (theta <= eps && theta >= -eps)
    fprintf("Singular case with theta: O No Solution")

%  Singular case with theta: +- pi >>> One solution
elseif (theta == +pi  || theta == -pi)
    fprintf("Singular case with theta: +- "+ pi +"\n")
    s_theta = 0
    c_theta = -1

    % Rotation by Axis Angle
    R_axis_angle = 2*r*r' - eye(3)

    % Write matrix opn output
    writematrix(R_axis_angle, 'output.txt', 'WriteMode', 'append')
    type 'output.txt'

    % Check if R is valid for axis angle rotation
    % If r invariant then is valid
    res = R_axis_angle*r
    if res == r
        fprintf("Invariant property OK :)")
    end

%% Regular case with theta
else
    % Skew Symmetric of r
    S = [0, -rz, ry; rz, 0, -rx; -ry, rx, 0] %%check

    % Rotation by Axis Angle
    R_axis_angle = r*r' + (eye(3) - r*r')*c_theta + S*s_theta

    % Write matrix opn output
    fprintf(fileID, "Rotation of: %f \n", theta)
    writematrix(r','output.txt', 'WriteMode', 'append' , 'Delimiter', 'tab' )
    fprintf(fileID, "[")
    for row=(1:3)
        for col=(1:3)
            if (col == 3) 
                fprintf(fileID, "%f]", R_axis_angle(row,col))
            end
            fprintf(fileID, "%f,", R_axis_angle(row,col))
        end
    end
    writematrix(R_axis_angle, 'output.txt', 'WriteMode', 'append')
    fprintf(fileID, "]")
    type 'output.txt'
    fprintf(fileID, "\n")

    % Check if R is valid for axis angle rotation
    % If r invariant then is valid
    res = R_axis_angle*r
    if res == r
        disp('Invariant property OK :)')
    end
end 

fclose(fileID);
