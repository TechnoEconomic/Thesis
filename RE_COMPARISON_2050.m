num_simulations = 10000;

%Common parameters
Discount_Rate_min = 0.06;       % assume 6-8%
Discount_Rate_max = 0.08;
Discount_Rate_values = unifrnd(Discount_Rate_min, Discount_Rate_max, [num_simulations, 1]);

Lifetime = 20;    % years

Electricity_Cost_values_W = 0.06;      %EUR/kWh
Electricity_Cost_values_P = 0.04;      %EUR/kWh

FLH_W = [0:3000];
FLH_P = [0:900];

LHV = 33.33;    %kWh/kgH2


%SOEC parameters
CAPEX_System_SOEC_mean = 750;     %$/kW
CAPEX_System_SOEC_std = 204.12;
CAPEX_System_SOEC_values = normrnd(CAPEX_System_SOEC_mean, CAPEX_System_SOEC_std, [num_simulations,1]);
CAPEX_System_SOEC_values(CAPEX_System_SOEC_values < 500) = 500;
CAPEX_System_SOEC_values(CAPEX_System_SOEC_values > 1000) = 1000;

%CAPEX_Stack_SOEC_values = 0.5*CAPEX_System_SOEC_values;    % 50% of CAPEX system 

CAPEX_SOEC_values = CAPEX_System_SOEC_values;

OPEX_SOEC_values = 3;   % 3% of CAPEX/a

System_Efficiency_SOEC_mean = 0.835;
System_Efficiency_SOEC_std = 0.0531;
System_Efficiency_SOEC_values = normrnd(System_Efficiency_SOEC_mean, System_Efficiency_SOEC_std, [num_simulations,1]);
System_Efficiency_SOEC_values(System_Efficiency_SOEC_values < 0.77) = 0.77;
System_Efficiency_SOEC_values(System_Efficiency_SOEC_values > 0.9) = 0.9;


%PEM parameters
CAPEX_System_PEM_mean = 550;      %$/kW
CAPEX_System_PEM_std = 285.77;
CAPEX_System_PEM_values = normrnd(CAPEX_System_PEM_mean, CAPEX_System_PEM_std, [num_simulations,1]);
CAPEX_System_PEM_values(CAPEX_System_PEM_values < 200) = 200;
CAPEX_System_PEM_values(CAPEX_System_PEM_values > 900) = 900;

%CAPEX_Stack_PEM_values = 0.35*CAPEX_System_PEM_values;    % 35% of CAPEX system

CAPEX_PEM_values = CAPEX_System_PEM_values;

OPEX_PEM_values = 3;

System_Efficiency_PEM_mean = 0.705;
System_Efficiency_PEM_std = 0.0286;
System_Efficiency_PEM_values = normrnd(System_Efficiency_PEM_mean, System_Efficiency_PEM_std, [num_simulations,1]);
System_Efficiency_PEM_values(System_Efficiency_PEM_values < 0.67) = 0.67;
System_Efficiency_PEM_values(System_Efficiency_PEM_values > 0.74) = 0.74;



%AEC parameters
CAPEX_System_AEC_mean = 450;     % $/kW
CAPEX_System_AEC_std = 204.12;
CAPEX_System_AEC_values = normrnd(CAPEX_System_AEC_mean, CAPEX_System_AEC_std, [num_simulations,1]);
CAPEX_System_AEC_values(CAPEX_System_AEC_values < 200) = 200;
CAPEX_System_AEC_values(CAPEX_System_AEC_values > 700) = 700;

%CAPEX_Stack_AEC_values = 0.35*CAPEX_System_AEC_values;     % 35% of CAPEX system

CAPEX_AEC_values = CAPEX_System_AEC_values;

OPEX_AEC_values = 3;

System_Efficiency_AEC_mean = 0.75;
System_Efficiency_AEC_std = 0.0408;
System_Efficiency_AEC_values = normrnd(System_Efficiency_AEC_mean, System_Efficiency_AEC_std, [num_simulations,1]);
System_Efficiency_AEC_values(System_Efficiency_AEC_values < 0.7) = 0.7;
System_Efficiency_AEC_values(System_Efficiency_AEC_values > 0.8) = 0.8;


% Calculate SOEC LCOH values
term1_S = LHV ./ System_Efficiency_SOEC_values;
term2_S = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_S = (OPEX_SOEC_values / 100);
term4_W = CAPEX_SOEC_values ./ FLH_W;
term4_P = CAPEX_SOEC_values ./ FLH_P;


LCOH_SOEC_W = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_W + Electricity_Cost_values_W);
LCOH_SOEC_P = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_P + Electricity_Cost_values_P);


% Calculate PEM LCOH values
term1_P = LHV ./ System_Efficiency_PEM_values;
term2_P = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_P = (OPEX_PEM_values / 100);
term4_W = CAPEX_PEM_values ./ FLH_W;
term4_P = CAPEX_PEM_values ./ FLH_P;

LCOH_PEM_W = term1_P .* ((term2_P ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_P) .* term4_W + Electricity_Cost_values_W);
LCOH_PEM_P = term1_P .* ((term2_P ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_P) .* term4_P + Electricity_Cost_values_P);


% Calculate AEC LCOH values
term1_A = LHV ./ System_Efficiency_AEC_values;
term2_A = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_A = (OPEX_AEC_values / 100);
term4_W = CAPEX_AEC_values ./ FLH_W;
term4_P = CAPEX_AEC_values ./ FLH_P;

LCOH_AEC_W = term1_A .* ((term2_A ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_A) .* term4_W + Electricity_Cost_values_W);
LCOH_AEC_P = term1_A .* ((term2_A ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_A) .* term4_P + Electricity_Cost_values_P);


avg_SOEC_W = mean(LCOH_SOEC_W);
avg_SOEC_P = mean(LCOH_SOEC_P);
avg_PEM_W = mean(LCOH_PEM_W);
avg_PEM_P = mean(LCOH_PEM_P);
avg_AEC_W = mean(LCOH_AEC_W);
avg_AEC_P = mean(LCOH_AEC_P);


% Plotting LCOH for each country based on FLH
figure;
hold on;

plot(FLH_W, avg_SOEC_W, 'DisplayName', 'SOEC W', 'LineWidth', 2, 'Color', [1, 0.3, 0.8, 0.5]);
plot(FLH_P, avg_SOEC_P, '--', 'DisplayName', 'SOEC P', 'LineWidth', 2, 'Color', 'r');
plot(FLH_W, avg_PEM_W, 'DisplayName', 'PEM W', 'LineWidth', 2, 'Color', 'c');
plot(FLH_P, avg_PEM_P, '--', 'DisplayName', 'PEM P', 'LineWidth', 2, 'Color', 'b');
plot(FLH_W, avg_AEC_W, 'DisplayName', 'AEC W', 'LineWidth', 2, 'Color', [0.3,0.8,0]);
plot(FLH_P, avg_AEC_P, '--', 'DisplayName', 'AEC P', 'LineWidth', 2, 'Color', 'g');

hold off;

% Set axis labels and legend
xlabel('Full Load Hour [h]');
ylabel('LCOH [€/kgH2]');
title('Scenario 1 2050');
legend('Location', 'Best');
grid on;
xlim([0 8760]);
ylim([0 30]);

Xtarget = 900;
H = findobj('type', 'line');
xvals = arrayfun(@(h) h.XData, H, 'uniform', 0);
yvals = arrayfun(@(h) h.YData, H, 'uniform', 0);
yinterp = cellfun(@(X,Y) interp1(X, Y, Xtarget), xvals, yvals);
yinterp(isnan(yinterp)) = [];
yinterp
