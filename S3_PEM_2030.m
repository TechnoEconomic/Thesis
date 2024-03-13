num_simulations = 1000;

%Common parameters
Discount_Rate_min = 0.06;       % assume 6-8%
Discount_Rate_max = 0.08;
Discount_Rate_values = unifrnd(Discount_Rate_min, Discount_Rate_max, [num_simulations, 1]);

Lifetime = 20;    % years

% Define electricity costs
FLH_DE = [0,55,90,197,232,236,304,398,697,720,736,804,1197,1220,1236,1304,1697,1720,1736,1804,2197,2220,2236,2780,3012,3500,4000,4500,5000,5500,5792];
FLH_FI = [0,55,90,197,232,236,304,398,697,720,736,804,1197,1220,1236,1304,1697,1720,1736,1804,2197,2220,2236,2697,2803,3000,3201,3500,4000,4500,5000,5500,6004];
FLH_SE = [0,55,90,197,232,236,304,398,697,720,736,804,1197,1220,1236,1304,1697,1720,1736,1804,2197,2220,2236,2304,2348,2438,2652,3152,3652,4152,4652,4786,5000,5500,6000,6500,7000,7134];
FLH_NO = [0,55,90,197,232,236,304,398,697,720,736,804,1197,1220,1236,1304,1697,1720,1736,1804,2197,2220,2236,2736,2882,2937,3118,3618,4118,4618,5118,5618,5819,6000,6500,7000,7500,8000,8500,8701];

%electricity_cost_DE_LU = [-0.019,-0.001,0.001,0.006,0.011,0.018,0.024,0.03,0.035,0.04,0.044,0.061,0.075,0.087,0.099,0.11,0.12,0.129,0.138,0.147,0.157,0.167,0.178,0.191,0.206,0.223,0.235];
%electricity_cost_FI = [-0.002,0,0.001,0.002,0.004,0.005,0.006,0.007,0.008,0.008,0.009,0.013,0.018,0.025,0.032,0.04,0.048,0.056,0.064,0.073,0.082,0.091,0.101,0.112,0.125,0.141,0.154];
%electricity_cost_SE = [-0.002,0,0.001,0.001,0.002,0.003,0.003,0.004,0.005,0.006,0.007,0.01,0.013,0.017,0.021,0.026,0.031,0.036,0.04,0.046,0.051,0.057,0.063,0.07,0.079,0.091,0.101];
%electricity_cost_NO = [0,0.005,0.012,0.018,0.023,0.027,0.031,0.035,0.039,0.043,0.046,0.057,0.065,0.071,0.077,0.082,0.086,0.091,0.095,0.098,0.102,0.106,0.111,0.118,0.126,0.138,0.146];

electricity_cost_DE_LU_H = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.013,0.027,0.041,0.053,0.065,0.076,0.082];
electricity_cost_FI_H = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.008,0.01,0.013,0.019,0.025,0.031,0.039,0.047];
electricity_cost_SE_H = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.007,0.01,0.014,0.017,0.021,0.022,0.024,0.029,0.033,0.039,0.044,0.046];
electricity_cost_NO_H = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.007,0.011,0.022,0.03,0.038,0.045,0.051,0.054,0.056,0.062,0.068,0.075,0.083,0.093,0.098];

electricity_cost_DE_LU_L = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.011,0.02,0.029,0.039,0.049,0.054];
electricity_cost_FI_L = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.007,0.009,0.013,0.016,0.021];
electricity_cost_SE_L = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.005,0.006,0.007,0.009,0.01,0.011,0.012,0.016,0.019,0.023,0.027,0.027];
electricity_cost_NO_L = [0,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.007,0.012,0.02,0.027,0.033,0.039,0.041,0.043,0.049,0.054,0.059,0.063,0.067,0.07];

% Create a table
%dataTable_DE_LU = table(FLH', electricity_cost_DE_LU', 'VariableNames', {'FLH', 'electricity_cost_DE_LU'});
%dataTable_FI = table(FLH', electricity_cost_FI', 'VariableNames', {'FLH', 'electricity_cost_FI'});
%dataTable_SE = table(FLH', electricity_cost_SE', 'VariableNames', {'FLH', 'electricity_cost_SE'});
%dataTable_NO = table(FLH', electricity_cost_NO', 'VariableNames', {'FLH', 'electricity_cost_NO'});

dataTable_DE_LU_H = table(FLH_DE', electricity_cost_DE_LU_H', 'VariableNames', {'FLH', 'electricity_cost_DE_LU_H'});
dataTable_FI_H = table(FLH_FI', electricity_cost_FI_H', 'VariableNames', {'FLH', 'electricity_cost_FI_H'});
dataTable_SE_H = table(FLH_SE', electricity_cost_SE_H', 'VariableNames', {'FLH', 'electricity_cost_SE_H'});
dataTable_NO_H = table(FLH_NO', electricity_cost_NO_H', 'VariableNames', {'FLH', 'electricity_cost_NO_H'});


dataTable_DE_LU_L = table(FLH_DE', electricity_cost_DE_LU_L', 'VariableNames', {'FLH', 'electricity_cost_DE_LU_L'});
dataTable_FI_L = table(FLH_FI', electricity_cost_FI_L', 'VariableNames', {'FLH', 'electricity_cost_FI_L'});
dataTable_SE_L = table(FLH_SE', electricity_cost_SE_L', 'VariableNames', {'FLH', 'electricity_cost_SE_L'});
dataTable_NO_L = table(FLH_NO', electricity_cost_NO_L', 'VariableNames', {'FLH', 'electricity_cost_NO_L'});

LHV = 33.33;    %kWh/kgH2

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

% Calculate SOEC LCOH values
term1_S = LHV ./ (System_Efficiency_PEM_values);
term2_S = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_S = (OPEX_PEM_values / 100);

term4_DE = CAPEX_PEM_values ./ FLH_DE;
term4_FI = CAPEX_PEM_values ./ FLH_FI;
term4_SE = CAPEX_PEM_values ./ FLH_SE;
term4_NO = CAPEX_PEM_values ./ FLH_NO;


%DE_LU = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_DE_LU);
%FI = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_FI);
%SE = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_SE);
%NO = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_NO);

DE_LU_H = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_DE + electricity_cost_DE_LU_H);
FI_H = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_FI + electricity_cost_FI_H);
SE_H = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_SE + electricity_cost_SE_H);
NO_H = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_NO + electricity_cost_NO_H);

DE_LU_L = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_DE + electricity_cost_DE_LU_L);
FI_L = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_FI + electricity_cost_FI_L);
SE_L = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_SE + electricity_cost_SE_L);
NO_L = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_NO + electricity_cost_NO_L);

%DE_LU_P = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_DE_LU_P);
%FI_P = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_FI_P);
%SE_P = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_SE_P);
%NO_P = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_NO_P);

%avg_DE_LU = mean(DE_LU);
%avg_FI = mean(FI);
%avg_SE = mean(SE);
%avg_NO = mean(NO);

avg_DE_LU_H = mean(DE_LU_H);
avg_FI_H = mean(FI_H);
avg_SE_H = mean(SE_H);
avg_NO_H = mean(NO_H);

avg_DE_LU_L = mean(DE_LU_L);
avg_FI_L = mean(FI_L);
avg_SE_L = mean(SE_L);
avg_NO_L = mean(NO_L);


% Plotting LCOH for each country based on FLH
figure;
hold on;

%plot(FLH, avg_DE_LU, 'DisplayName', 'DE', 'LineWidth', 2, 'Color', [0.2,0.5,0.2]);
%plot(FLH, avg_FI, 'DisplayName', 'FI', 'LineWidth', 2, 'Color', 'm');
%plot(FLH, avg_SE, 'DisplayName', 'SE', 'LineWidth', 2, 'Color', 'b');
%plot(FLH, avg_NO, 'DisplayName', 'NO', 'LineWidth', 2, 'Color', 'r');

plot(FLH_DE, avg_DE_LU_H, '-', 'DisplayName', 'DE', 'LineWidth', 2, 'Color', 'y');
plot(FLH_FI, avg_FI_H, '-', 'DisplayName', 'FI', 'LineWidth', 2, 'Color', 'm');
plot(FLH_SE, avg_SE_H, '-', 'DisplayName', 'SE', 'LineWidth', 2, 'Color', 'b');
plot(FLH_NO, avg_NO_H, '-', 'DisplayName', 'NO', 'LineWidth', 2, 'Color', 'r');

plot(FLH_DE, avg_DE_LU_L, '--', 'DisplayName', 'DE', 'LineWidth', 2, 'Color', 'y');
plot(FLH_FI, avg_FI_L, '--', 'DisplayName', 'FI', 'LineWidth', 2, 'Color', 'm');
plot(FLH_SE, avg_SE_L, '--', 'DisplayName', 'SE', 'LineWidth', 2, 'Color', 'b');
plot(FLH_NO, avg_NO_L, '--', 'DisplayName', 'NO', 'LineWidth', 2, 'Color', 'r');


%plot(FLH, avg_DE_LU_P, ':', 'DisplayName', 'DE_P', 'LineWidth', 2, 'Color', [0.2,0.5,0.2]);
%plot(FLH, avg_FI_P, ':', 'DisplayName', 'FI_P', 'LineWidth', 2, 'Color', 'm');
%plot(FLH, avg_SE_P, ':', 'DisplayName', 'SE_P', 'LineWidth', 2, 'Color', 'b');
%plot(FLH, avg_NO_P, ':', 'DisplayName', 'NO_P', 'LineWidth', 2, 'Color', 'r');

hold off;

% Set axis labels and legend
xlabel('Full Load Hour [h]');
ylabel('LCOH [€/kgH2]');
title('S3 PEM 2030');
legend('Location', 'Best');
grid on;
ylim([0 6]);

% create patches to fill the areas
fidx = isfinite(avg_DE_LU_H) & isfinite(avg_DE_LU_L);
patch( ...
    [FLH_DE(fidx) flip(FLH_DE(fidx))], ...
    [avg_DE_LU_H(fidx) flip(avg_DE_LU_L(fidx))], ...
    'y', ...
    'EdgeColor','none', ...
    'FaceAlpha',0.5, ...
    'HandleVisibility','off')
fidx = isfinite(avg_FI_H) & isfinite(avg_FI_L);
patch( ...
    [FLH_FI(fidx) flip(FLH_FI(fidx))], ...
    [avg_FI_H(fidx) flip(avg_FI_L(fidx))], ...
    'm', ...
    'EdgeColor','none', ...
    'FaceAlpha',0.5, ...
    'HandleVisibility','off')
fidx = isfinite(avg_SE_H) & isfinite(avg_SE_L);
patch( ...
    [FLH_SE(fidx) flip(FLH_SE(fidx))], ...
    [avg_SE_H(fidx) flip(avg_SE_L(fidx))], ...
    'b', ...
    'EdgeColor','none', ...
    'FaceAlpha',0.5, ...
    'HandleVisibility','off')
fidx = isfinite(avg_NO_H) & isfinite(avg_NO_L);
patch( ...
    [FLH_NO(fidx) flip(FLH_NO(fidx))], ...
    [avg_NO_H(fidx) flip(avg_NO_L(fidx))], ...
    'r', ...
    'EdgeColor','none', ...
    'FaceAlpha',0.5, ...
    'HandleVisibility','off')