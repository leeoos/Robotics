%%Sopravvivenza_AIRO! 
%% Author: Massimo, Miryam, Leonardo, Federico, Francesco

clc
clear all
close all

%% Define Parameters

eps = 10^-10;
rad2 = sqrt(2)


%% Case A -> Regular Case
r = [1/rad2; -1/2 ; 1/2]
theta = -pi/4
rx = r(1);
ry= r(2);
rz= r(3);
s_theta = sin(theta);
c_theta = cos(theta);


%Skew Symmetric of r
S = [0, -rz, ry; rz, 0, -rx; -ry, rx, 0]

%Rotation by Axis Angle
R_axis_angle = r*r' + (eye(3) - r*r')*c_theta + S*s_theta

if R_axis_angle*r == r
    disp('Invariant property OK :)')
end

%theta_inv = atan2()






%% Case B -> Singular Easy
% r = [1/rad2; 1/rad2 ; 1/2];
% theta = pi;

%% Case C -> Singular Low Resolution
% r = [ 0; 1/rad2 ; 1/rad2];
% theta = eps;
