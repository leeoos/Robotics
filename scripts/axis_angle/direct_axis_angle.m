%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

clc
clear all
close all

%% Define Parameters
eps = 10^-10;

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

    % Redefinition of sin and cos theta to be sure
    s_theta = 0
    c_theta = -1

    % Rotation by Axis Angle
    R_axis_angle = 2*r*(r') - eye(3)

    writeInOutput(r, theta, R_axis_angle);

    validate(R_axis_angle, r);

%% Regular case with theta
else
    fprintf("Regular case with theta: "+ theta +" >>> 1 Solution \n")

    % Skew Symmetric of r
    S = [0, -rz, ry; rz, 0, -rx; -ry, rx, 0] %%check

    % Rotation by Axis Angle
    R_axis_angle = r*(r)' + (eye(3) - r*(r)')*c_theta + S*s_theta

    writeInOutput(r, theta, R_axis_angle);
    
    validate(R_axis_angle, r)

end 

%% Output File
% Write matrix on output.txt
function w = writeInOutput(r, theta, R_axis_angle)
    % Open output file
    fileID = fopen('output.txt', 'a');
    
    fprintf(fileID, "\nRotation of angle: %f\n", theta);
    fprintf(fileID, "On vector: ");
    for index=(1:3) 
        fprintf(fileID, "%f    ", r(index));
    end
    fprintf(fileID, "\nMatrix: [");
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
    fclose(fileID);
end

% Check if R is valid for the axis angle rotation
% If r is invariant then R is valid
function inv = validate(R, r)
    eps_check = 10^-15; 
    res = R*r
    if (res - r <= eps_check)
        fprintf("Invariant property OK :) \n")
    end
end
