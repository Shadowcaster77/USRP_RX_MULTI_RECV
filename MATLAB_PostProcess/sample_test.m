clear
clc
A = readtable('sample.txt');
% col_1 = readtable('sample.txt', 'Format','%f %*f %*f %*f %*f %*f');

areal = A{:, 1};
acomplex = A{:,2}
strreal = string(areal);
newStrreal = erase(strreal,"[")

strcomplex = string(acomplex);
newStrcomplex = erase(strcomplex,"]");

areal_f = str2double(newStrreal)
areal_c = str2double(newStrcomplex)

a_IQ = areal_f + i * areal_c;

y = fft(a_IQ);

subplot(311); 
plot(areal_f)
title('real'); 

subplot(312); 
plot(areal_c); 
title('imag')