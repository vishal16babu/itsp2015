function [freq,amp]=compile(x,note,subnote)

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
%Generate the plot, title and labels.
%figure(200+10*note+subnote);
%plot(x);
%title('Sine Wave Signal');
%xlabel('Time (s)'); 
%ylabel('Amplitude');
%figure(10*note+subnote);
%plot(f,mx);
%title('Power Spectrum of a Sine Wave');
%xlabel('Frequency (Hz)'); 
%ylabel('Power');


 [~,j]=min(-mx);
 
 
 funda=fund_freq(j,mx);
 funda2=diff_fund(j,mx);
 if(funda2==0)
     funda2=funda;
 end
 if(round(f(funda)/f(j))==1)
     funda=j;
 end
  %fprintf('frequency is %d   amplitude is %d \n ',f(j),mx(j));
  %fprintf('fundamental frequency is %d   amplitude is %d \n ',f(funda),mx(funda));
  %fprintf('fundamental frequency 2 is %d   amplitude is %d \n ',f(funda2),mx(funda2));
  %fprintf('slow method frequency is %d \n ',frequency(x));
  factor=1;
  if(round(f(funda)/f(funda2))==1 )
     freq=f(funda);
     amp=1;
  else 
  freq=f(funda2);
  amp=1;
  end
  if(freq<100 && f(funda)>100)
      freq=f(funda);
  else
      if(freq<100 && f(funda)<100 && f(j)>100)
          freq=f(j);
      end
  end
  %fprintf('final frequency is %d   amplitude is %d \n ',freq,amp);
  %freq=more_artificial(freq)/2;
  fprintf(freqtonote(freq));
