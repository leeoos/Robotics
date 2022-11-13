%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

clc
clear all
close all


%% Output File
fileID = fopen('output.txt', 'a');

%% Define Parameters
eps = 10^-10;
eps_check = 10^-15; 

%% Insert values for rotation vector and angle
rx = input("Insert rx ");
ry = input("Insert ry ");
rz = input("Insert rz ");
theta = input("Insert theta: ");

% Define  rotation vector, sin and cos of angle
r = [rx; ry; rz]
s_theta = sin(theta)
c_theta = cos(theta)


%  Singular case with theta: 0 >>> No solution
if (theta <= eps && theta >= -eps)
    fprintf("Singular case with theta: O >>> No Solution \n")

%  Singular case with theta: +- pi >>> One solution
elseif (theta == +pi  || theta == -pi)
    fprintf("Singular case with theta: +- "+ pi +" >>> 2 Solutions \n")
    s_theta = 0
    c_theta = -1

    % Rotation by Axis Angle
    R_axis_angle = 2*r*r' - eye(3)

    % TODO 
    % Write matrix opn output 
    writematrix(R_axis_angle, 'output.txt', 'WriteMode', 'append')
    type 'output.txt'

    % Check if R is valid for axis angle rotation
    % If r invariant then is valid
    res = R_axis_angle*r
    if (res - r <= eps_check)
        fprintf("Invariant property OK :) \n")
    end

%% Regular case with theta
else
    % Skew Symmetric of r
    S = [0, -rz, ry; rz, 0, -rx; -ry, rx, 0] %%check

    % Rotation by Axis Angle
    R_axis_angle = r*r' + (eye(3) - r*r')*c_theta + S*s_theta

    % Write matrix on output.txt
    fprintf(fileID, "\n Rotation of angle: %f\n", theta);
    fprintf(fileID, "On vector: ");
    writematrix(r','output.txt', 'WriteMode', 'append' , 'Delimiter', 'tab' );
    fprintf(fileID, "Matrix: ");
    fprintf(fileID, "[");
    for row=(1:3)
        for col=(1:3)
            if (col == 3) 
                fprintf(fileID, "%f;", R_axis_angle(row,col));
            else
                fprintf(fileID, "%f,", R_axis_angle(row,col));
            end
        end
    end  
    fprintf(fileID, "]");
    type 'output.txt'
    fprintf(fileID, "\n");

    % Check if R is valid for axis angle rotation
    % If r invariant then is valid
    res = R_axis_angle*r
    if (res - r <= eps_check)
        fprintf("Invariant property OK :) \n")
    end
end 

fclose(fileID);
