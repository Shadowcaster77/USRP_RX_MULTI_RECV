close all
clear
clc
fileID = fopen('tx_nocali/10_1__r_ch0');
Areal = fread(fileID, 'float');

fileID_2 = fopen('tx_nocali/10_1__i_ch0');
Acomplex = fread(fileID_2, 'float');

fileID_3 = fopen('tx_id_correct/10_1__r_ch0');
breal = fread(fileID_3, 'float');
% 
fileID_4 = fopen('tx_id_correct/10_1__i_ch0');
bcomplex = fread(fileID_4, 'float');
% 
fileID_5 = fopen('tx_dc/10_1__r_ch0');
creal = fread(fileID_5, 'float');
% % 
fileID_6 = fopen('tx_dc/10_1__i_ch0');
ccomplex = fread(fileID_6, 'float');
% 
fileID_7 = fopen('tx_all/10_1__r_ch0');
dreal = fread(fileID_7, 'float');
% % % %
fileID_8 = fopen('tx_all/10_1__i_ch0');
dcomplex = fread(fileID_8, 'float');
% 
aIQ = Areal + i * Acomplex;
bIQ = breal + i * bcomplex;
cIQ = creal + i * ccomplex;
dIQ = dreal + i * dcomplex;
% y = fft(areal);

delayed_signal = delayseq(aIQ,2e-5,1e6); % this delay works


figure(1)
plot(Areal(1:512),"b");
hold on
plot(Acomplex(1:512),"g");
legend("Inphase signal", "Quadrature signal");
title("IQ Data for channel 0")
xlabel("Sample number");
ylabel("Voltage");

% figure(2)
% plot(Breal(1:512),"b");
% hold on
% plot(Bcomplex(1:512),"g");
% legend("Inphase signal", "Quadrature signal");
% title("IQ Data for channel 2")
% xlabel("Sample number");
% ylabel("Voltage");
% 
% figure(3)
% plot(real(delayed_signal(1:512)),"b");
% hold on
% plot(imag(delayed_signal(1:512)),"g");
% legend("Inphase signal", "Quadrature signal");
% title("IQ Data for delayed channel 0")
% xlabel("Sample number");
% ylabel("Voltage");

figure(2)
periodogram(aIQ,hamming(length(aIQ)),[],1e6,"centered")
title("power spectral density tx no cali")

% figure(3)
% periodogram(bIQ,hamming(length(bIQ)),[],1e6,"centered")
% title("power spectral density for tx iq correction")
% 
% figure(4)
% periodogram(cIQ,hamming(length(cIQ)),[],1e6,"centered")
% title("power spectral density for tx dc correction")
% 
% figure(5)
% periodogram(dIQ,hamming(length(dIQ)),[],1e6,"centered")
% title("power spectral density for tx dc correction + iq correction")


% figure(5)
% subplot(411); 
% plot(Areal(1:512))
% title('CH0 real'); 
% 
% subplot(412); 
% plot(Acomplex(1:512)); 
% title('CHO imag')
% 
% subplot(413); 
% plot(Breal(1:512))
% title('CH2 real'); 
% 
% subplot(414); 
% plot(Bcomplex(1:512)); 
% title('CH2 imag')

% figure(6)
% periodogram(bIQ,hamming(length(bIQ)),[],1e6,"centered")
% title("power spectral density for channel 1")
% 
% figure(7)
% plot(Areal(1:1024), "b");
% hold on
% plot(Breal(1:1024), "g");
% legend("real_ch0", "real_ch2");
% title("phase comprison")
% xlabel("Sample number");
% ylabel("Voltage");

% delayed_signal = delayseq(aIQ,3.8e-5,1e6);
% figure(8)
% plot(real(delayed_signal(1:1024)),"b");
% hold on
% plot(Breal(1:1024),"g");
% legend("real_ch0", "real_ch2");
% title("after shift")
% xlabel("Sample number");
% ylabel("Voltage");


% subplot(313); 
% plot(y); 
% title('fft')