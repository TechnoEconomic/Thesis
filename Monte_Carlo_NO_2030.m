num_simulations = 10000;

%Common parameters
Discount_Rate_min = 0.06;       % assume 6-8%
Discount_Rate_max = 0.08;
Discount_Rate_values = unifrnd(Discount_Rate_min, Discount_Rate_max, [num_simulations, 1]);

Lifetime = 20;    % years

Electricity_Cost_values = 0.087;      %EUR/kWh

FLH = 8701;

LHV = 33.33;    %kWh/kgH2


%SOEC parameters
CAPEX_System_SOEC_mean = 1800;     %$/kW
CAPEX_System_SOEC_std = 816.5;
CAPEX_System_SOEC_values = normrnd(CAPEX_System_SOEC_mean, CAPEX_System_SOEC_std, [num_simulations,1]);
CAPEX_System_SOEC_values(CAPEX_System_SOEC_values < 800) = 800;
CAPEX_System_SOEC_values(CAPEX_System_SOEC_values > 2800) = 2800;

%CAPEX_Stack_SOEC_values = 0.5*CAPEX_System_SOEC_values;    % 50% of CAPEX system 

CAPEX_SOEC_values = CAPEX_System_SOEC_values;

OPEX_SOEC_values = 3;   % 3% of CAPEX/a

System_Efficiency_SOEC_mean = 0.805;
System_Efficiency_SOEC_std = 0.0286;
System_Efficiency_SOEC_values = normrnd(System_Efficiency_SOEC_mean, System_Efficiency_SOEC_std, [num_simulations,1]);
System_Efficiency_SOEC_values(System_Efficiency_SOEC_values < 0.77) = 0.77;
System_Efficiency_SOEC_values(System_Efficiency_SOEC_values > 0.84) = 0.84;


%PEM parameters
CAPEX_System_PEM_mean = 1075;      %$/kW
CAPEX_System_PEM_std = 347.01;
CAPEX_System_PEM_values = normrnd(CAPEX_System_PEM_mean, CAPEX_System_PEM_std, [num_simulations,1]);
CAPEX_System_PEM_values(CAPEX_System_PEM_values < 650) = 650;
CAPEX_System_PEM_values(CAPEX_System_PEM_values > 1500) = 1500;

%CAPEX_Stack_PEM_values = 0.35*CAPEX_System_PEM_values;    % 35% of CAPEX system

CAPEX_PEM_values = CAPEX_System_PEM_values;

OPEX_PEM_values = 3;

System_Efficiency_PEM_mean = 0.655;
System_Efficiency_PEM_std = 0.0204;
System_Efficiency_PEM_values = normrnd(System_Efficiency_PEM_mean, System_Efficiency_PEM_std, [num_simulations,1]);
System_Efficiency_PEM_values(System_Efficiency_PEM_values < 0.63) = 0.63;
System_Efficiency_PEM_values(System_Efficiency_PEM_values > 0.68) = 0.68;


%AEC parameters
CAPEX_System_AEC_mean = 625;     % $/kW
CAPEX_System_AEC_std = 183.71;
CAPEX_System_AEC_values = normrnd(CAPEX_System_AEC_mean, CAPEX_System_AEC_std, [num_simulations,1]);
CAPEX_System_AEC_values(CAPEX_System_AEC_values < 400) = 400;
CAPEX_System_AEC_values(CAPEX_System_AEC_values > 850) = 850;

%CAPEX_Stack_AEC_values = 0.35*CAPEX_System_AEC_values;     % 35% of CAPEX system

CAPEX_AEC_values = CAPEX_System_AEC_values;

OPEX_AEC_values = 3;

System_Efficiency_AEC_mean = 0.68;
System_Efficiency_AEC_std = 0.0245;
System_Efficiency_AEC_values = normrnd(System_Efficiency_AEC_mean, System_Efficiency_AEC_std, [num_simulations,1]);
System_Efficiency_AEC_values(System_Efficiency_AEC_values < 0.65) = 0.65;
System_Efficiency_AEC_values(System_Efficiency_AEC_values > 0.71) = 0.71;


% Calculate SOEC LCOH values
term1_S = LHV ./ System_Efficiency_SOEC_values;
term2_S = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_S = (OPEX_SOEC_values / 100);
term4_S = CAPEX_SOEC_values ./ FLH;
LCOH_SOEC = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + Electricity_Cost_values);


% Calculate PEM LCOH values
term1_P = LHV ./ System_Efficiency_PEM_values;
term2_P = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_P = (OPEX_PEM_values / 100);
term4_P = CAPEX_PEM_values ./ FLH;
LCOH_PEM = term1_P .* ((term2_P ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_P) .* term4_P + Electricity_Cost_values);


% Calculate AEC LCOH values
term1_A = LHV ./ System_Efficiency_AEC_values;
term2_A = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_A = (OPEX_AEC_values / 100);
term4_A = CAPEX_AEC_values ./ FLH;
LCOH_AEC = term1_A .* ((term2_A ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_A) .* term4_A + Electricity_Cost_values);

% Create histograms for SOEC, AEC, and PEM LCOH values
figure;
% SOEC LCOH
subplot(3, 1, 1);
histogram(LCOH_SOEC, 'Normalization', 'probability', 'EdgeColor', 'w');
Ax1 = gca;
[dRL{1},dBE{1},dBC{1},dBD{1}] = drawRedLine(Ax1);
xlabel('LCOH (per kWh)');
ylabel('Probability');
title('SOEC LCOH');
ylim([0, 0.1]);
% AEC LCOH
subplot(3, 1, 2);
histogram(LCOH_AEC, 'Normalization', 'probability', 'EdgeColor', 'w');
Ax2 = gca;
[dRL{2},dBE{2},dBC{2},dBD{2}] = drawRedLine(Ax2);
xlabel('LCOH (per kWh)');
ylabel('Probability');
title('AEC LCOH');
ylim([0, 0.1]);
% PEM LCOH
subplot(3, 1, 3);
histogram(LCOH_PEM, 'Normalization', 'probability', 'EdgeColor', 'w');
Ax3 = gca;
[dRL{3},dBE{3},dBC{3},dBD{3}] = drawRedLine(Ax3);
xlabel('LCOH (per kWh)');
ylabel('Probability');
title('PEM LCOH');
ylim([0, 0.1]);
% Adjust layout
sgtitle('Monte Carlo Simulation Results for SOEC, AEC, and PEM');
% Show the plot


DN = ["SOEC LCOH" "AEC LCOH" "PEM LCOH"];

figure
hold on
for k = 1:3
    hb = bar(dBC{k}, dBD{k}, 'DisplayName',[DN(k)], 'FaceAlpha',0.5);
    % plot(BE{k}, RL{k}, 'LineWidth',3, 'DisplayName',[DN(k)+" Distribution"], 'Color','r')
    plot(dBE{k}, dRL{k}, 'LineWidth',3, 'DisplayName',[DN(k)+" Distribution"], 'Color',hb.FaceColor)
end
hold off
grid
xlabel('LCOH [€/kgH2]');
ylabel('Probability');
title('Norway in 2030 8701h Min')
legend('Location','northoutside')

% function drawRedLine(axh)
% %   Draws the red line in each histogram subplot.
%     H = axh.Children;
%     BinCtrs = H.BinEdges(1:end-1)+diff(H.BinEdges)/2;
%     B = polyfit(BinCtrs,H.Values,2) ;
%     RedLine = polyval(B, BinCtrs);
%     FudgeFactor = max(H.Values) - max(RedLine);
%     hold on
%     plot(axh,BinCtrs, RedLine  + FudgeFactor,  '-r', 'LineWidth',1)
%     hold off
% end

function [dRL,dBE,dBC,dBD] = drawRedLine(axh)                           % MODIFIED: Add Outputs
%   Draws the red line in each histogram subplot.
    H = axh.Children;
    BinCtrs = H.BinEdges(1:end-1)+diff(H.BinEdges)/2;
    Data = H.Values;
    u = mean(BinCtrs);
    s = std(Data);
    ndpdf = @(b,x) b(1) .* exp(-(x-b(2)).^2 ./ b(3));
    B = fminsearch(@(b)norm(Data-ndpdf(b,BinCtrs)), [max(H.Values); u; s]);
    % text(axh, B(2), max(H.Values), sprintf('$p(x) = %.3fe^{-\\frac{(%.2f-x)^2}{%.3f}}$', B), 'Horiz','center','Vert','bottom','Interpreter','latex')
    RedLine = ndpdf(B, H.BinEdges);
    hold on
    plot(axh,H.BinEdges, RedLine,  '-r', 'LineWidth',1.5)
    hold off
    dRL = RedLine;
    dBE = H.BinEdges;
    dBC = BinCtrs;
    dBD = Data;
end