clear
clc
%fileID = fopen("2xUSRP_1xUSRP_sync_now_Sample_204800_Noise/x310_20220122T223939Z_ch_0_binary");
%fileID = fopen("2xUSRP_1xUSRP_sync_now_Sample_204800_sine/x310_20220122T210807Z_ch_0_binary");
fileID = fopen("x310_20220122T224526Z_ch_2_binary");
A = fread(fileID, 'float');
areal = A([1:2:length(A)]);
aimg  = A([2:2:length(A)]);
% 
% acomplex = areal + i * aimg;
% y = fft(acomplex);

subplot(311); 
plot(areal)
title('real'); 

subplot(312); 
plot(aimg); 
title('imag')

% subplot(313); 
% plot(y); 
% title('fft')