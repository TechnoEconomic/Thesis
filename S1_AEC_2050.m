num_simulations = 1000;

%Common parameters
Discount_Rate_min = 0.06;       % assume 6-8%
Discount_Rate_max = 0.08;
Discount_Rate_values = unifrnd(Discount_Rate_min, Discount_Rate_max, [num_simulations, 1]);

Lifetime = 20;    % years

% Define electricity costs
electricity_cost_AT     = 0.261;
electricity_cost_BE     = 0.245;
electricity_cost_BG     = 0.253;
electricity_cost_CZ     = 0.247;
electricity_cost_DE_LU  = 0.235;
electricity_cost_DK     = 0.215;
electricity_cost_EE     = 0.193;
electricity_cost_ES     = 0.168;
electricity_cost_FI     = 0.154;
electricity_cost_FR     = 0.276;
electricity_cost_GR     = 0.280;
electricity_cost_HR     = 0.272;
electricity_cost_HU     = 0.272;
electricity_cost_IE     = 0.223;
electricity_cost_IT     = 0.312;
electricity_cost_LT     = 0.230;
electricity_cost_LV     = 0.227;
electricity_cost_NL     = 0.242;
electricity_cost_PL     = 0.167;
electricity_cost_PT     = 0.168;
electricity_cost_RO     = 0.265;
electricity_cost_SE     = 0.101;
electricity_cost_SI     = 0.274;
electricity_cost_SK     = 0.265;
electricity_cost_NO     = 0.146;


FLH = [1000:8760];

LHV = 33.33;    %kWh/kgH2

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
term1_S = LHV ./ (System_Efficiency_AEC_values);
term2_S = Discount_Rate_values .* (1 + Discount_Rate_values).^Lifetime;
term3_S = (OPEX_AEC_values / 100);
term4_S = CAPEX_AEC_values ./ FLH;
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
plot(FLH, avg_BE, 'DisplayName', 'BE', 'LineWidth', 2, 'Color', [0.1,0.8,0]);
plot(FLH, avg_BG, 'DisplayName', 'BG', 'LineWidth', 2, 'Color', [0.5,0.35,0.2]);
plot(FLH, avg_CZ, 'DisplayName', 'CZ', 'LineWidth', 2, 'Color', [0.2,0,0.5]);
plot(FLH, avg_DE_LU, 'DisplayName', 'DE_LU', 'LineWidth', 2, 'Color', [0.2,0.5,0.2]);
plot(FLH, avg_DK, 'DisplayName', 'DK', 'LineWidth', 2, 'Color', [0.1,0.4,0.2]);
plot(FLH, avg_EE, 'DisplayName', 'EE', 'LineWidth', 2, 'Color', 'y');
plot(FLH, avg_ES, 'DisplayName', 'ES', 'LineWidth', 2, 'Color', [0.1,0.5,0.2]);
plot(FLH, avg_FI, 'DisplayName', 'FI', 'LineWidth', 2, 'Color', 'm');
plot(FLH, avg_FR, 'DisplayName', 'FR', 'LineWidth', 2, 'Color', [0.1,0.75,0.75]);
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
xlabel('FLH');
ylabel('LCOH');
title('LCOH of Each Country');
legend('Location', 'Best');
grid on;
ylim([4 20]);