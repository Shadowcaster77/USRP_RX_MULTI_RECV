close all
clear
clc
fileID = fopen('Mul_Rev_all/quick_test_similar8_sync_test2/x310__ch_0_binary');
A = fread(fileID, 'float');
areal = A([1:2:length(A)]);
aimg  = A([2:2:length(A)]);


fileID_2 = fopen('Mul_Rev_all/quick_test_similar8_sync_test2/x310__ch_3_binary');
A_2 = fread(fileID_2, 'float');
areal_2 = A_2([1:2:length(A_2)]);
aimg_2  = A_2([2:2:length(A_2)]);
% 
acomplex = areal + i * aimg;
acomplex_2 = areal_2 + i * aimg_2;
% y = fft(areal);

delayed_signal = delayseq(acomplex,2e-5,1e6); % this delay works
delayed_signal_2 = delayseq(acomplex_2,0.25e-3,5e6);

figure(1)
plot(real(acomplex(1:512)),"b");
hold on
plot(imag(acomplex(1:512)),"g");
legend("Inphase signal", "Quadrature signal");
title("IQ Data for channel 0")
xlabel("Sample number");
ylabel("Voltage");

figure(2)
plot(real(acomplex_2(1:512)),"b");
hold on
plot(imag(acomplex_2(1:512)),"g");
legend("Inphase signal", "Quadrature signal");
title("IQ Data for channel 14")
xlabel("Sample number");
ylabel("Voltage");

figure(3)
plot(real(delayed_signal(1:512)),"b");
hold on
plot(imag(delayed_signal(1:512)),"g");
legend("Inphase signal", "Quadrature signal");
title("IQ Data for delayed channel 0")
xlabel("Sample number");
ylabel("Voltage");

figure(4)
periodogram(acomplex,hamming(length(acomplex)),[],5e6,"centered")
title("power spectral density for channel 0")

figure(5)
subplot(411); 
plot(areal)
title('CH0 real'); 

subplot(412); 
plot(aimg); 
title('CHO imag')

subplot(413); 
plot(areal_2)
title('CH10 real'); 

subplot(414); 
plot(aimg_2); 
title('CH10 imag')

figure(6)
periodogram(acomplex_2,hamming(length(acomplex_2)),[],5e6,"centered")
title("power spectral density for channel 1")

figure(7)
plot(areal(1:800));
hold on
plot(areal_2(1:800));
legend("real_ch0", "real ch14 / 100");
title("phase comprison")
xlabel("Sample number");
ylabel("Voltage");

delayed_signal = delayseq(acomplex,2e-5,1e6);
figure(8)
plot(real(delayed_signal),"b");
hold on
plot(real(acomplex_2),"g");
legend("real ch0", "real ch5");
title("after shift")
xlabel("Sample number");
ylabel("Voltage");


% subplot(313); 
% plot(y); 
% title('fft')