num_simulations = 1000;

%Common parameters
Discount_Rate_min = 0.06;       % assume 6-8%
Discount_Rate_max = 0.08;
Discount_Rate_values = unifrnd(Discount_Rate_min, Discount_Rate_max, [num_simulations, 1]);

Lifetime = 20;    % years

% Define electricity costs
FLH = [0,100,200,300,400,500,600,700,800,900,1000,1500,2000,2500,3000,3500,4000,4500,5000,5500,6000,6500,7000,7500,8000,8500,8760];

electricity_cost_AT = [0,0.011,0.026,0.038,0.049,0.057,0.064,0.07,0.075,0.08,0.084,0.101,0.115,0.126,0.136,0.144,0.152,0.16,0.167,0.176,0.184,0.194,0.206,0.218,0.232,0.249,0.261];
electricity_cost_BE = [-0.1,-0.031,-0.012,0.001,0.012,0.021,0.03,0.037,0.043,0.049,0.054,0.074,0.091,0.105,0.116,0.127,0.136,0.145,0.154,0.163,0.172,0.181,0.192,0.203,0.217,0.233,0.245];
electricity_cost_BG = [0,0.007,0.019,0.03,0.039,0.048,0.056,0.062,0.068,0.073,0.078,0.097,0.11,0.121,0.131,0.14,0.149,0.157,0.165,0.173,0.181,0.19,0.201,0.212,0.225,0.241,0.253];
electricity_cost_CZ = [-0.022,0.004,0.018,0.029,0.039,0.047,0.053,0.059,0.063,0.067,0.071,0.085,0.098,0.109,0.12,0.129,0.138,0.146,0.154,0.163,0.171,0.181,0.192,0.204,0.218,0.235,0.247];
electricity_cost_DE_LU = [-0.019,-0.001,0.001,0.006,0.011,0.018,0.024,0.03,0.035,0.04,0.044,0.061,0.075,0.087,0.099,0.11,0.12,0.129,0.138,0.147,0.157,0.167,0.178,0.191,0.206,0.223,0.235];
electricity_cost_DK = [-0.009,0,0.003,0.006,0.009,0.011,0.014,0.017,0.020,0.024,0.027,0.041,0.053,0.065,0.076,0.086,0.096,0.106,0.115,0.125,0.134,0.144,0.155,0.168,0.183,0.202,0.215];
electricity_cost_EE = [0,0.004,0.008,0.01,0.013,0.016,0.019,0.022,0.025,0.029,0.032,0.047,0.059,0.069,0.077,0.085,0.092,0.099,0.107,0.115,0.122,0.131,0.14,0.151,0.163,0.18,0.193];
electricity_cost_ES = [0,0.003,0.009,0.019,0.028,0.036,0.042,0.048,0.053,0.057,0.061,0.075,0.085,0.093,0.1,0.107,0.112,0.118,0.123,0.128,0.133,0.138,0.144,0.149,0.154,0.161,0.168];
electricity_cost_FI = [-0.002,0,0.001,0.002,0.004,0.005,0.006,0.007,0.008,0.008,0.009,0.013,0.018,0.025,0.032,0.04,0.048,0.056,0.064,0.073,0.082,0.091,0.101,0.112,0.125,0.141,0.154];
electricity_cost_FR = [-0.001,0.015,0.034,0.048,0.058,0.066,0.072,0.078,0.083,0.088,0.092,0.111,0.126,0.137,0.147,0.156,0.164,0.172,0.18,0.188,0.197,0.207,0.219,0.231,0.245,0.263,0.276];
electricity_cost_GR = [0,0.046,0.069,0.083,0.095,0.104,0.111,0.118,0.124,0.128,0.133,0.15,0.162,0.171,0.179,0.185,0.192,0.198,0.204,0.210,0.217,0.225,0.234,0.243,0.254,0.269,0.280];
electricity_cost_HR = [-0.05,0.009,0.026,0.041,0.053,0.062,0.069,0.075,0.080,0.086,0.09,0.109,0.124,0.136,0.146,0.155,0.163,0.171,0.179,0.187,0.196,0.206,0.217,0.229,0.243,0.260,0.272];
electricity_cost_HU = [0,0.016,0.034,0.048,0.059,0.067,0.073,0.079,0.084,0.088,0.092,0.109,0.123,0.134,0.144,0.153,0.161,0.169,0.177,0.185,0.194,0.204,0.215,0.228,0.242,0.259,0.272];
electricity_cost_IE = [-0.03,-0.005,0.003,0.016,0.027,0.035,0.041,0.046,0.051,0.055,0.058,0.072,0.082,0.092,0.1,0.108,0.117,0.124,0.132,0.14,0.147,0.156,0.164,0.174,0.185,0.198,0.208];
electricity_cost_IT = [0.007,0.068,0.084,0.094,0.104,0.112,0.12,0.126,0.132,0.137,0.141,0.158,0.169,0.178,0.186,0.193,0.2,0.207,0.216,0.225,0.235,0.246,0.258,0.271,0.285,0.301,0.312];
electricity_cost_LT = [0,0.008,0.011,0.015,0.02,0.025,0.029,0.034,0.039,0.043,0.047,0.063,0.074,0.084,0.093,0.102,0.111,0.12,0.129,0.138,0.148,0.158,0.17,0.183,0.198,0.216,0.23];
electricity_cost_LV = [0,0.008,0.011,0.015,0.019,0.024,0.029,0.033,0.038,0.042,0.046,0.062,0.073,0.083,0.092,0.1,0.109,0.118,0.127,0.136,0.145,0.156,0.167,0.18,0.195,0.213,0.227];
electricity_cost_NL = [-0.222,-0.029,-0.012,0.001,0.012,0.022,0.032,0.039,0.046,0.052,0.057,0.078,0.095,0.108,0.12,0.13,0.138,0.147,0.155,0.163,0.171,0.18,0.19,0.201,0.214,0.23,0.242];
electricity_cost_PL = [0.016,0.04,0.052,0.059,0.064,0.068,0.071,0.074,0.076,0.078,0.08,0.086,0.091,0.096,0.1,0.104,0.109,0.113,0.117,0.122,0.126,0.131,0.137,0.142,0.149,0.158,0.167];
electricity_cost_PT = [0,0.003,0.009,0.019,0.028,0.036,0.043,0.049,0.054,0.058,0.062,0.075,0.085,0.094,0.101,0.107,0.113,0.119,0.124,0.129,0.134,0.139,0.144,0.149,0.155,0.161,0.168];
electricity_cost_RO = [0,0.007,0.019,0.03,0.041,0.05,0.058,0.064,0.07,0.075,0.08,0.098,0.112,0.123,0.133,0.143,0.152,0.16,0.169,0.177,0.186,0.196,0.208,0.221,0.235,0.252,0.265];
electricity_cost_SE = [-0.002,0,0.001,0.001,0.002,0.003,0.003,0.004,0.005,0.006,0.007,0.01,0.013,0.017,0.021,0.026,0.031,0.036,0.04,0.046,0.051,0.057,0.063,0.07,0.079,0.091,0.101];
electricity_cost_SI = [0,0.018,0.035,0.05,0.06,0.068,0.075,0.081,0.086,0.091,0.096,0.114,0.128,0.14,0.15,0.158,0.166,0.174,0.182,0.19,0.199,0.208,0.219,0.232,0.245,0.262,0.274];
electricity_cost_SK = [-0.01,0.011,0.026,0.039,0.049,0.057,0.063,0.068,0.072,0.076,0.08,0.096,0.11,0.122,0.133,0.143,0.151,0.16,0.168,0.177,0.186,0.196,0.208,0.220,0.235,0.252,0.265];
electricity_cost_NO = [0,0.005,0.012,0.018,0.023,0.027,0.031,0.035,0.039,0.043,0.046,0.057,0.065,0.071,0.077,0.082,0.086,0.091,0.095,0.098,0.102,0.106,0.111,0.118,0.126,0.138,0.146];


% Create a table
dataTable_AT = table(FLH', electricity_cost_AT', 'VariableNames', {'FLH', 'electricity_cost_AT'});
dataTable_BE = table(FLH', electricity_cost_BE', 'VariableNames', {'FLH', 'electricity_cost_BE'});
dataTable_BG = table(FLH', electricity_cost_BG', 'VariableNames', {'FLH', 'electricity_cost_BG'});
dataTable_CZ = table(FLH', electricity_cost_CZ', 'VariableNames', {'FLH', 'electricity_cost_CZ'});
dataTable_DE_LU = table(FLH', electricity_cost_DE_LU', 'VariableNames', {'FLH', 'electricity_cost_DE_LU'});
dataTable_DK = table(FLH', electricity_cost_DK', 'VariableNames', {'FLH', 'electricity_cost_DK'});
dataTable_EE = table(FLH', electricity_cost_EE', 'VariableNames', {'FLH', 'electricity_cost_EE'});
dataTable_ES = table(FLH', electricity_cost_ES', 'VariableNames', {'FLH', 'electricity_cost_ES'});
dataTable_FI = table(FLH', electricity_cost_FI', 'VariableNames', {'FLH', 'electricity_cost_FI'});
dataTable_FR = table(FLH', electricity_cost_FR', 'VariableNames', {'FLH', 'electricity_cost_FR'});
dataTable_GR = table(FLH', electricity_cost_GR', 'VariableNames', {'FLH', 'electricity_cost_GR'});
dataTable_HR = table(FLH', electricity_cost_HR', 'VariableNames', {'FLH', 'electricity_cost_HR'});
dataTable_HU = table(FLH', electricity_cost_HU', 'VariableNames', {'FLH', 'electricity_cost_HU'});
dataTable_IE = table(FLH', electricity_cost_IE', 'VariableNames', {'FLH', 'electricity_cost_IE'});
dataTable_IT = table(FLH', electricity_cost_IT', 'VariableNames', {'FLH', 'electricity_cost_IT'});
dataTable_LT = table(FLH', electricity_cost_LT', 'VariableNames', {'FLH', 'electricity_cost_LT'});
dataTable_LV = table(FLH', electricity_cost_LV', 'VariableNames', {'FLH', 'electricity_cost_LV'});
dataTable_NL = table(FLH', electricity_cost_NL', 'VariableNames', {'FLH', 'electricity_cost_NL'});
dataTable_PL = table(FLH', electricity_cost_PL', 'VariableNames', {'FLH', 'electricity_cost_PL'});
dataTable_PT = table(FLH', electricity_cost_PT', 'VariableNames', {'FLH', 'electricity_cost_PT'});
dataTable_RO = table(FLH', electricity_cost_RO', 'VariableNames', {'FLH', 'electricity_cost_RO'});
dataTable_SE = table(FLH', electricity_cost_SE', 'VariableNames', {'FLH', 'electricity_cost_SE'});
dataTable_SI = table(FLH', electricity_cost_SI', 'VariableNames', {'FLH', 'electricity_cost_SI'});
dataTable_SK = table(FLH', electricity_cost_SK', 'VariableNames', {'FLH', 'electricity_cost_SK'});
dataTable_NO = table(FLH', electricity_cost_NO', 'VariableNames', {'FLH', 'electricity_cost_NO'});

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

% Calculate PEM LCOH values
term1_S = LHV ./ (System_Efficiency_PEM_values);
term2_S = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_S = (OPEX_PEM_values / 100);
term4_S = CAPEX_PEM_values ./ FLH;

AT = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_AT);
BE = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_BE);
BG = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_BG);
CZ = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_CZ);
DE_LU = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_DE_LU);
DK = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_DK);
EE = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_EE);
ES = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_ES);
FI = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_FI);
FR = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_FR);
GR = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_GR);
HR = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_HR);
HU = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_HU);
IE = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_IE);
IT = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_IT);
LT = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_LT);
LV = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_LV);
NL = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_NL);
PL = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_PL);
PT = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_PT);
RO = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_RO);
SE = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_SE);
SI = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_SI);
SK = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_SK);
NO = term1_S .* ((term2_S ./ ((1 + Discount_Rate_values).^Lifetime - 1) + term3_S) .* term4_S + electricity_cost_NO);


avg_AT = mean(AT);
avg_BE = mean(BE);
avg_BG = mean(BG);
avg_CZ = mean(CZ);
avg_DE_LU = mean(DE_LU);
avg_DK = mean(DK);
avg_EE = mean(EE);
avg_ES = mean(ES);
avg_FI = mean(FI);
avg_FR = mean(FR);
avg_GR = mean(GR);
avg_HR = mean(HR);
avg_HU = mean(HU);
avg_IE = mean(IE);
avg_IT = mean(IT);
avg_LT = mean(LT);
avg_LV = mean(LV);
avg_NL = mean(NL);
avg_PL = mean(PL);
avg_PT = mean(PT);
avg_RO = mean(RO);
avg_SE = mean(SE);
avg_SI = mean(SI);
avg_SK = mean(SK);
avg_NO = mean(NO);



% Plotting LCOH for each country based on FLH
figure;
hold on;

plot(FLH, avg_AT, 'DisplayName', 'AT', 'LineWidth', 2, 'Color', [0,0.75,0.75]);
plot(FLH, avg_BE, 'DisplayName', 'BE', 'LineWidth', 2, 'Color', [0.1,0.8,0.5]);
plot(FLH, avg_BG, 'DisplayName', 'BG', 'LineWidth', 2, 'Color', [0.5,0.35,0.2]);
plot(FLH, avg_CZ, 'DisplayName', 'CZ', 'LineWidth', 2, 'Color', [0.2,0,0.5]);
plot(FLH, avg_DE_LU, 'DisplayName', 'DE_LU', 'LineWidth', 2, 'Color', [0.93,0.69,0.13]);
plot(FLH, avg_DK, 'DisplayName', 'DK', 'LineWidth', 2, 'Color', [0.9,0.4,0.2]);
plot(FLH, avg_EE, 'DisplayName', 'EE', 'LineWidth', 2, 'Color', [0.4,0.5,0.2]);
plot(FLH, avg_ES, 'DisplayName', 'ES', 'LineWidth', 2, 'Color', [0.1,0.5,0.2]);
plot(FLH, avg_FI, 'DisplayName', 'FI', 'LineWidth', 2, 'Color', 'm');
plot(FLH, avg_FR, 'DisplayName', 'FR', 'LineWidth', 2, 'Color', [0.3,0.75,0.75]);
plot(FLH, avg_GR, 'DisplayName', 'GR', 'LineWidth', 2, 'Color', [0.75,0,0.75]);
plot(FLH, avg_HR, 'DisplayName', 'HR', 'LineWidth', 2, 'Color', [0.75,0.75,0]);
plot(FLH, avg_HU, 'DisplayName', 'HU', 'LineWidth', 2, 'Color', [0.25,0.25,0.25]);
plot(FLH, avg_IE, 'DisplayName', 'IE', 'LineWidth', 2, 'Color', [0.5,0.25,0.25]);
plot(FLH, avg_IT, 'DisplayName', 'IT', 'LineWidth', 2, 'Color', [0.2,0.5,0.4]);
plot(FLH, avg_LT, 'DisplayName', 'LT', 'LineWidth', 2, 'Color', [0.3,0.25,0.8]);
plot(FLH, avg_LV, 'DisplayName', 'LV', 'LineWidth', 2, 'Color', [0.3,0.8,0]);
plot(FLH, avg_NL, 'DisplayName', 'NL', 'LineWidth', 2, 'Color', [0,0.8,0.5]);
plot(FLH, avg_PL, 'DisplayName', 'PL', 'LineWidth', 2, 'Color', [0.8,0.8,0.8]);
plot(FLH, avg_PT, 'DisplayName', 'PT', 'LineWidth', 2, 'Color', 'c');
plot(FLH, avg_RO, 'DisplayName', 'RO', 'LineWidth', 2, 'Color', [0.2,0.45,0.8]);
plot(FLH, avg_SE, 'DisplayName', 'SE', 'LineWidth', 2, 'Color', 'b');
plot(FLH, avg_SI, 'DisplayName', 'SI', 'LineWidth', 2, 'Color', [0.4,0.4,0.4]);
plot(FLH, avg_SK, 'DisplayName', 'SK', 'LineWidth', 2, 'Color', [0.6,0.6,0.6]);
plot(FLH, avg_NO, 'DisplayName', 'NO', 'LineWidth', 2, 'Color', 'r');

hold off;

% Set axis labels and legend
xlabel('Full Load Hour [h]');
ylabel('LCOH [€/kgH2]');
title('S2-2 PEM 2030');
legend('Location', 'Best');
grid on;
ylim([0 20]);