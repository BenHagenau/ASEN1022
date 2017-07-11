%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ASEN 1022: Tensile Testing Lab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determine Yeild Strength
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Benjamin K. Hagenau
% Created: 6/27/17
% Edited: 6/27/17
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUTS: Stres, Strain
% OUTPUTS: Yeild Stress


function [E,YS,TS,FS] = Analysis1022(stress, strain, name, rangeElim,rangeInt,str)
%% determine slope of elastic period and therefore Youngs Modulus
m = diff([stress(1) stress(rangeElim)])/diff([strain(1) strain(rangeElim)]);
E = m;

%% Eliminate outlies
% Extrapolate line
f = @(stress) stress*(1/m);
shift = .002*max(strain);
% Create ideal line to compare outliers to
for i = 1:rangeElim
    strainCheck(i) = f(stress(i));
    stressCheck(i) = stress(i);
end
% compare and remove outliers as needed
for i = 1:rangeElim
    if strain(i) > strainCheck(i) + .9*shift || strain(i) < strainCheck(i) - .9*shift
        strain(i) = strainCheck(i);
        stress(i) = stressCheck(i);
    end
end

%% Determine YS, TS, FS
% Tensile stress
loc = find(stress == max(stress));
TS = stress(loc);
TS_strain = strain(loc);

% apply 2% strain shift to slope line
point = 0;
for i = 1:rangeInt
    strainShift(i) = f(stress(i)) + shift;
    stressShift(i) = stress(i);

    if strainShift(i) < strain(i) && point == 0
        point = i;
        interp_points = [i i-1];
        y1 = stress(i-1);
        y2 = stress(i);
        x1 = strain(i-1);
        x2 = strain(i);
        x = strainShift(i);
    end
end

% interpolate to obtain YS
YS = y1 + (x-x1)*(y2 - y1)/(x2-x1);

% determine FS
check = 1;
count = 0;
while check == 1
    maxStrain = max(strain(1:end - count));
    it = find(strain == maxStrain);
    if stress(it) > .1*TS
        check = 0;
        FS = stress(it);
        break
    end
    count = count + 1;
end
% plot
figure
plot(strain,stress,'.'); hold on; 
plot(strainShift,stressShift,'--r')
plot(TS_strain,TS,'og')
plot(x,YS,'o')
plot(strain(it),FS,'ok')
title(name); 
xlabel('Strain, [in/in]');
ylabel('Stress, [lbf/(in*in)]');
legend('Stress', 'Elastic Line Shift', 'Tensile Strenght',...
    'Yeild Stress','Failure Stress')
%saveas(gcf,str,'epsc')

end









