function data=artificial(length,freq,amp,factor)
amp=amp*factor ;
fs=44100  ;% sampling frequency
values=0:1:length-1;
data=amp*sin((2*pi* freq*values)/fs).*exp(-(log(7/2)*values)/length);