clear;
clc
close all;
addpath('../../library/nav_lib');

%% inital state
SV_pos_ecef = [26580000, 0, 0]';
SV_vel_evef = [0 1755 3170]';
lat = 0.785398;
lon =  0.174533;
ght = 1000;
R0 = 6378137;
e = 0.0818191908425;
omaga = 7.29E-05;
c = 299792458;

[~, RE ] = ch_earth(lat, ght);

 [r,~,Cn2e] = ch_ned2ecef(lat, lon, ght, [0 0 0]',eye(3));
%% delta XYZ
delta = SV_pos_ecef - r;
n = norm(delta);
%% Line-Of-Sight unit vector
I_ecef = delta/n;

%% Range rate
r_rate = I_ecef'*SV_vel_evef;

%% Transformation of line of sight to north, east, down
I_ned = Cn2e'*I_ecef;

%% Elevation and azimuth
theta = rad2deg(-asin (I_ned(3)));
psi = rad2deg(atan2(I_ned(2), I_ned(1)));


