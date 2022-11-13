%% Sopravvivenza_AIRO! 
% Author: Massimo, Miryam, Leonardo, Federico, Francesco, Paolo

% Symbolic formulas are not functions! Once they have symbolic form, 
% any symbolic variables in them are not substituted with numeric values unless you use subs() 
%to tell it to do the substitutions.

clc
clear all
close all

%% Define Symbols
syms theta psi phi


s_theta = sin(theta)
c_theta = cos(theta)

s_phi = sin(phi)
c_phi = cos(phi)

s_psi = sin(psi)
c_psi = cos(psi)




Rx = [1     0     0;
      0 c_theta -s_theta;
      0 s_theta c_theta;]


Ry = [c_phi  0 s_phi;
      0        1       0;
      -s_phi 0 c_phi;]


Rz =  [c_psi -s_psi 0;
      -s_psi c_psi 0;
      0       0    1;]


RES = Rz