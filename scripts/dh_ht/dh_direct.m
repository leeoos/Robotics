%% DH transformation matrices and direct kinematics of a serial robot (SCARA example)
%% 5 Nov 2012 (DH frames assigned as in lecture slides 09_DirectKinematics, A. De Luca)

clear all
clc

%% Define symbolic variables

syms alpha d a theta

%% number of joints of SCARA (in general you have to insert input)

N=6; % va cambiato a seconda dell'esigenza 

%% Insert DH table of parameters of SCARA

%% a and d are variable 
DHTABLE = [  -pi/2 sym('a1') sym('d1') sym('t1');
             0 sym('a2') sym('d2') sym('t2') ;
             pi sym('a3') sym('d3') sym('t3');
             pi/2 sym('a4') sym('d4') sym('t4');
             -pi/2 sym('a5') sym('d5') sym('t5');
             0 sym('a6') sym('d6') sym('t6')];


         
%% Build the general Denavit-Hartenberg trasformation matrix
TDH = [ cos(theta) -sin(theta)*cos(alpha)  sin(theta)*sin(alpha) a*cos(theta);
        sin(theta)  cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta);
          0             sin(alpha)             cos(alpha)            d;
          0               0                      0                   1];

%% Build transformation matrices for each link
% First, we create an empty cell array

A = cell(1,N);

% For every row in 'DHTABLE' we substitute the right value inside
% the general DH matrix

for i = 1:N
    alpha = DHTABLE(i,1);
    a = DHTABLE(i,2);
    d = DHTABLE(i,3);
    theta = DHTABLE(i,4);
    A{i} = subs(TDH);
end

%% Direct kinematics

disp('Direct kinematics of SCARA robot in symbolic form (simplifications may need some time)')

disp(['Number of joints N=',num2str(N)])

% Note: 'simplify' may need some time

T = eye(4);

for i=1:N 
    T = T*A{i};
    T = simplify(T);
end

% output TN matrix

T0N = T

% output ON position

p = T(1:3,4)

% output xN axis

n=T(1:3,1)

% output yN axis

s=T(1:3,2)

% output zN axis

a=T(1:3,3)

%% end
