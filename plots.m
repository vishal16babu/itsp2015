function y=plots(x,note)
nfft = length(x); % Length of FFT
% Take fft, padding with zeros so that length(X)is equal to nfft
X = fft(x,nfft); 
% FFT is symmetric, throw away second half
lenth=round(nfft/2);
X = X(1:lenth);
% Take the magnitude of fft of x
mx = (abs(X))/lenth;
% Frequency vector
f = (0:lenth-1)*44100/nfft;
% Generate the plot, title and labels.
figure(note);
plot(x,'g');

title('Sine Wave Signal');
xlabel('Time (s)'); 
ylabel('Amplitude');
figure(note+1);
plot(f,mx,'r');
title('Power Spectrum of a Sine Wave');
xlabel('Frequency (Hz)'); 
ylabel('Power');

