%%Sopravvivenza_AIRO! 
%% Author: Massimo, Miryam, Leonardo, Federico, Francesco

clc
clear all
close all

%% Define Symbols

eps = 10^-10;

%% Inverse Problem

% We generate a 3x3 Rotation Matrix, that after we want to fill
%R = zeros(3,3);
%
%% Insert numbers of your Rotation Matrix
%for row=(1:3)
%    for col=(1:3)
%        value = input(sprintf("Insert value (%d,%d)", row, col));
%        R(row,col) = value;
%    end
%end


R = [ 0 0 0;
      0 0 0;
      0 0 0;]


% We print the Matrix for Inverse Problem
R

a1 = (R(1,2) - R(2,1))^2;
a2 = (R(1,3) - R(3,1))^2;
a3 = (R(2,3) - R(3,2))^2;
x = sqrt(a1+a2+a3);
y = R(1,1) + R(2,2) + R(3,3) - 1;

theta1 = atan2(x,y)
theta2 = atan2(-x, y)


if 

if sin(theta1) ~= 0
    k = 1/(2*sin(theta1));
    r1x = k*(R(3,2) - R(2,3));
    r1y = k*(R(1,3) - R(3,1));
    r1z = k*(R(2,1) - R(1,2));
end

r1 = [r1x; r1y; r1z] 

if sin(theta2) ~= 0
    k = 1/(2*sin(theta2));
    r2x = k*(R(3,2) - R(2,3));
    r2y = k*(R(1,3) - R(3,1));
    r2z = k*(R(2,1) - R(1,2));
end

r2 = [r2x; r2y; r2z]

R*r1
R*r2
norm(r1)*norm(r2)
