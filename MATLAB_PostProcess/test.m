fileID = fopen('x310_20220120T230941Z_ch_2_binary');

A = fread(fileID, 'float');
areal = A([1:2:length(A)]);
aimg  = A([2:2:length(A)]);


% y = areal + i * aimg;
% plot(y)

subplot(211); 
plot(areal)
title('real'); 
% 
subplot(212); 
plot(aimg); 
title('imag')

tq