close all
clear
clc
fileID = fopen('Cali/rx_iq_correct_tx_iq_imb_dc_nocal/x310__ch_0_binary');
A = fread(fileID, 'float');
areal = A([1:2:length(A)]);
aimg  = A([2:2:length(A)]);


fileID_2 = fopen('Cali/rx_iq_correct_tx_iq_imb_dc_cal/x310__ch_0_binary');
A_2 = fread(fileID_2, 'float');
areal_2 = A_2([1:2:length(A_2)]);
aimg_2  = A_2([2:2:length(A_2)]);


fileID_3 = fopen('Cali/rx_iq_correct_tx_iq_correct_dc_nocal/x310__ch_0_binary');
A_3 = fread(fileID_3, 'float');
areal_3 = A_3([1:2:length(A_3)]);
aimg_3  = A_3([2:2:length(A_3)]);

fileID_4 = fopen('Cali/rx_iq_correct_tx_iq_correct_dc_cal/x310__ch_0_binary');
A_4 = fread(fileID_4, 'float');
areal_4 = A_4([1:2:length(A_4)]);
aimg_4  = A_4([2:2:length(A_4)]);

fileID_5 = fopen('Cali/all_cali/x310__ch_0_binary');
A_5 = fread(fileID_5, 'float');
areal_5 = A_5([1:2:length(A_5)]);
aimg_5  = A_5([2:2:length(A_5)]);
% 
acomplex = areal + i * aimg;
acomplex_2 = areal_2 + i * aimg_2;
acomplex_3 = areal_3 + i * aimg_3;
acomplex_4 = areal_4 + i * aimg_4;
acomplex_5 = areal_5 + i * aimg_5;
% y = fft(areal);

delayed_signal = delayseq(acomplex,2e-5,1e6); % this delay works
delayed_signal_2 = delayseq(acomplex_2,0.25e-3,5e6);

figure(1)
periodogram(acomplex,hamming(length(acomplex)),[],1e6,"centered")
title("power spectral density no cali")

figure(2)
periodogram(acomplex_2,hamming(length(acomplex_2)),[],1e6,"centered")
title("power spectral density for tx dc cali")

figure(3)
periodogram(acomplex_3,hamming(length(acomplex_3)),[],1e6,"centered")
title("power spectral density for tx iq cali")

figure(4)
periodogram(acomplex_4,hamming(length(acomplex_4)),[],1e6,"centered")
title("power spectral density for rx iq cali")

figure(5)
periodogram(acomplex_5,hamming(length(acomplex_5)),[],1e6,"centered")
title("power spectral density for all cali")

figure(6)
plot(areal(1:800));
hold on
plot(areal_2(1:800));
legend("real_ch0", "real ch14 / 100");
title("phase comprison")
xlabel("Sample number");
ylabel("Voltage");

%manuelly check with parameters from csv:
ar_t = transpose(areal);
ai_t = transpose(aimg);
iqmatrix = [ar_t; ai_t];
A = 0.0086877;
B = -0.00335315;
time_matrix_1 = [A/64+1, 0];
time_matrix_2 = [B/64, 1];
time_matrix = [time_matrix_1; time_matrix_2];

iq_new = time_matrix * iqmatrix;
ar_n = transpose(iq_new(1,:));
ar_c = transpose(iq_new(2,:));

acomplex = ar_n + i*ar_c;
figure(7)
periodogram(acomplex,hamming(length(acomplex)),[],1e6,"centered")
title("power spectral density after manually set")


% subplot(313); 
% plot(y); 
% title('fft')