%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASEN 1022: Tensile Testing Lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASEN 1022 Tensile Testing Lab Main Script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Benjamin K. Hagenau
% Created: 6/27/17
% Edited: 6/28/17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUTS: data file
% OUTPUTS: displacement & load

% Units: english
% time between samples is 1 sec
% [corss head position [inch], load [lbs], displacement [inch]

%% Main
clc; clear all; close all;
addpath /Users/Benjamin/Documents/MATLAB/functions
plotsettings

% Iterate data files
for f = 1:2
    
if f == 1
    file = 'Ductile_Group7';
    name = 'Stress - Strain Diagram | Ductile | Group 7';
    str = 'Ductile7';
    rangeElim = 30;
    rangeInt = 36;
    check = 1;
elseif f == 2
    file = 'Cast_Group7';
    name = 'Stress - Strain Diagram | Cast | Group 7';
    str = 'Cast7';
    rangeElim = 150/2;
    rangeInt = 150;
    check = 1;
elseif f == 3
    file = 'Ductile_Group1';
    name = 'Stress - Strain Diagram | Ductile | Group 1';
    str = 'Ductile1';
    rangeElim = 17;
    rangeInt = 20;
    check = 1;
elseif f == 4
    file = 'Cast_Group1';
    name = 'Stress - Strain Diagram | Cast | Group 1';
    str = 'Cast1';
    rangeElim = 100;
    rangeInt = 150;
    check = 1;
elseif f == 5
    file = 'Ductile_Group2';
    name = 'Stress - Strain Diagram | Ductile | Group 2';
    str = 'Ductile2';
    rangeElim = 8;
    rangeInt = 25;
    check = 1;
elseif f == 6
    file = 'Cast_Group2';
    name = 'Stress - Strain Diagram | Cast | Group 2';
    str = 'Cast2';
    rangeElim = 12;
    rangeInt = 15;
    check = 1;
elseif f == 7
    file = 'Ductile_Group3';
    name = 'Stress - Strain Diagram | Ductile | Group 3';
    str = 'Ductile3';
    rangeElim = 15;
    rangeInt = 50;
    check = 1;
elseif f == 8
    file = 'Cast_Group3';
    name = 'Stress - Strain Diagram | Cast | Group 3';
    str = 'Cast3';
    rangeElim = 50;
    rangeInt = 150;
    check = 1;
elseif f == 9
    file = 'Ductile_Group4';
    name = 'Stress - Strain Diagram | Ductil | Group 4';
    str = 'Ductile4';
    rangeElim = 200;
    rangeInt = 400;
    check = 1;
elseif f == 10
    file = 'Cast_Group4';
    name = 'Stress - Strain Diagram | Cast | Group 4';
    str = 'Cast4';
    rangeElim = 50;
    rangeInt = 150;
    check = 1;  
elseif f == 11
    file = 'Ductile_Group5';
    name = 'Stress - Strain Diagram | Ductile | Group 5';
    str = 'Ductile5';
    rangeElim = 30;
    rangeInt = 50;
    check = 0;
elseif f == 12
    file = 'Cast_Group5';
    name = 'Stress - Strain Diagram | Cast | Group 5';
    str = 'Cast5';
    rangeElim = 90;
    rangeInt = 150;
    check = 2;
end

%% Read and Sort Data
[stress, strain, force, elongation,data] = read1022(file,check);
% zero data
stressShift = 0 - stress(1);
stress = stress + stressShift;
strainShift = 0 - strain(1);
strain = strain + strainShift;

%% Determine Yeild Strength
[E,YS,TS,FS] = Analysis1022(stress, strain, name, rangeElim,rangeInt,str);
fprintf('%s Sample:\n', str)
fprintf('   Youngs Modulus: %.3f [lbs/inch^2]\n', E)
fprintf('   Yield Stress: %.3f [lbs/inch^2]\n',YS)
fprintf('   Ultimate Stress: %.3f [lbs/inch^2]\n',TS)
fprintf('   Failure Stress: %.3f [lbs/inch^2]\n',FS)
end














