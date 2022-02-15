%%-------------------------------------------------------------------------
% biomechanical_model.m
% Author: Akira Nagamori
% Descriptions: Biomechanical model described in Fink et al. (2014)
% x = [theta; ... % Joint angle
%     theta_dot;... % Angular velocity
%     T_e;... Extensor torque
%     T_e_dot;... First derivative of extensor torque
%     T_f;... Flexor torque
%     T_f_dot]; First derivative of flexor torque
% u = [I_e;... Input to extensor 
%     I_f]; Input to flexor 
% A = state matrix 
% A1 = delay matrix for sensory feedback 
% B = input matrix
%%-------------------------------------------------------------------------

close all
clear all
clc
% simulation paarmaters 
Fs = 1000; % sampling rate
time = 0:1/Fs:0.5; % time vector [sec]

% model parameters 
k = 0.5; % damping coefficient 
tau_m = 9.6/1000; % time constant
h = 1; % feedback gain (1.6 as f_c with no delay)
t_delay = 0*Fs/1000+1;% feedback delay

x = [0; ...
    0;...
    0;...
    0;...
    0;...
    0];
A = [0 1 0 0 0 0; ...
    0 -k/tau_m 1/tau_m^2 0 -1/tau_m^2 0;...
    0 0 0 1 0 0;...
    0 0 -1/tau_m^2 -2/tau_m 0 0;...
    0 0 0 0 0 1;...
    0 0 0 0 -1/tau_m^2 -2/tau_m];

A1 = [0 0 0 0 0 0; ...
    0 0 0 0 0 0;...
    0 0 0 0 0 0;...
    0 -h/tau_m 0 0 0 0;...
    0 0 0 0 0 0;...
    0 h/tau_m 0 0 0 0];

B = [0 0;...
    0 0;...
    0 0;...
    1/tau_m^2 0;...
    0 0;...
    0 1/tau_m^2];

% define input
u = [0;0];
I_e = 25*exp(-(time-0.025).^2/(2*0.01^2));
I_f = zeros(1,length(time));

% variables to store data
x_mat = zeros(length(x),length(time));
x_mat(:,1) = x;

% Simulate model output
tic
for t = 1:length(time)
    u(1) = I_e(t);
    u(2) = I_f(t);
    if t > t_delay
        x_dot = A*x +A1*x_mat(:,t-t_delay) + B*u;
    else
        x_dot = A*x +B*u;
    end
    x = x_dot*1/Fs+x;
    
    x_mat(:,t) = x;
end
toc

% Plot output
figure(1)
subplot(2,1,1)
plot(time,x_mat(1,:))
hold on 
subplot(2,1,2)
plot(time,x_mat(2,:))
hold on