%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASEN 1022: Tensile Testing Lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read in the data file for ASEN 1022 tensile testing lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Benjamin K. Hagenau
% Created: 6/27/17
% Edited: 6/27/17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUTS: data file
% OUTPUTS: stress, strain, force, elongation

% Units: english
% time between samples is 1 sec
% [corss head position [inch], load [lbs], displacement [inch]

function [stress, strain, force, elongation,data] = read1022(filename,check)
if check == 1
    data = load(filename, '-ascii');
end

if check == 0
    Data = load(filename);
    data = Data.Group5_Ductile;
end

if check == 2
    Data = load(filename);
    data = Data.Group5_Brittle;
end

area = 0.5 * 0.251969; % [inch^2] 

stress = data(:,2)/area; % [lbs/inch^2]
strain = data(:,3);      % [inch/inch]
force = data(:,2);       % [lbs]
elongation = data(:,3);  % [inch]



end

