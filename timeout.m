function when=timeout(song,FS)

% written by Nick Berndsen
% last updated 12-10-06
% song is the sound vector
% FS is the sampling frequency

%--------------------- define things -------------------------------------%
P=5200/44100*FS;        % length of filter (5200 recommended, I think...)
N=length(song);         % length of song
thresh=0.1;             % threshold for note detection
threshlow=-0.3;
reso=round(P*1.5);      % will be used in peak isolation - this is the
                        % number of points after an edge is found that a
                        % new edge may be found P*1.5 works for faster
                        % songs, p*1.75 works for slower songs
                        

% ---------------% bind the song b/w -1 and 1 %---------------------------%
song=song/max(abs(song));


%---------------------% build filter %------------------------------------%
detect=gaussfilt(P);


%---% convolve the filter with the abs(song) using a fast convolution %---%
edges=fconv(abs(song),detect);
tedges=edges(P/2:N+P/2-1);         % shift by P/2 so peaks line up w/ edges
tedges=tedges/max(abs(tedges));    % bind b/w -1 and 1


%-------------------------% find where the peaks occur %------------------%
times=zeros(1,N);       % will be a vector of maxima above the threshold
for c=2:N               % this for loop finds the maxima (note pressed)
    if tedges(c)>thresh
        if tedges(c)>tedges(c-1)
            times(c)=1;
            times(c-1)=0;
        end
    end
end

for c=2:N               % this for loop finds the minima (note let go)
    if tedges(c)<threshlow
        if tedges(c)<tedges(c-1)
            times(c)=1;
            times(c-1)=0;
        end
    end
end

for d=2:N               % this for-loop kills redundant maxima
    if times(d)==1
        if (N-d <= reso)
            times(d+1:N)=0;
        else
            times(d+1:d+reso)=0;
            d=d+reso;    % updade d just to skip some steps and save time
        end
    end
end

count=1;temp=[];
for e=1:N       % this for-loop actually figures out where the peaks occur     
    if times(e)==1
        temp(count)=e;
        count=count+1;
    end
end
when=temp;             % activate this if you want the output in points

%endsum=sum(times(N-reso:N));    % add a point at the end for Scott
%if (endsum == 0)
   % when(length(when)+1)=N;
%end
    

%when=(temp/FS);       % activate this if you want the output in time




%--------------------% some handy plots %---------------------------------%

%figure(6)
%hold on
%title('Song & Detected Edges as Stems','fontsize',28)
%xlabel('Time (s)','fontsize',28)
%ylabel('Amplitude / Edge','fontsize',28)
%stem([1/FS:1/FS:N/FS],times,'r','linewidth',2)
%plot([1/FS:1/FS:N/FS],song,'k')
%ylim([1.1*min(song) 1.1*max(song)])
%xlim([0 N/FS])

%figure(16)
%hold on
%title('Song Filtered With Edge Detector','fontsize',28)
%xlabel('Time (s)','fontsize',28)
%ylabel('Amplitude','fontsize',28)
%stem([1/FS:1/FS:N/FS],times,'r')
%plot([1/FS:1/FS:N/FS],tedges,'k','linewidth',1.6)
%ylim([-.5 1.1])
%xlim([0 N/FS])
%hold off

if 0
figure(26)
plot([1/FS:1/FS:length(detect)/FS],detect,'k','linewidth',4)
title('Edge-Detection Filter','fontsize',28)
xlabel('Time (s)','fontsize',28)
ylabel('Amplitude','fontsize',28)
ylim([1.1*min(detect) 1.1*max(detect)])
xlim([0 length(detect)/FS])
end


%---------% play the song and return, man %-------------%
pause(4)
%soundsc(song,FS,16)
return



% ------ This is code for fast convolution ------- %
function out=fconv(f,h)
P=length(f)+length(h)-1;
fnew=zeros(1,P);
hnew=zeros(1,P);
fnew(1:length(f))=f;
hnew(1:length(h))=h;
out=ifft(fft(fnew).*fft(hnew));
return



% ------------- % This is code to make the edge detecting filter % ----%
function filter=gaussfilt(N)

% calculate alpha so the filter fills all N points
alpha=N;
first=-(1-N/2)*exp(-(1-N/2)^2/alpha);
count=0;
while first<.1*(-(1530/4000*N-N/2)*exp(-(1530/4000*N-N/2)^2/alpha))
    count=count+1;
    alpha=N*500*count;
    first=-(1-N/2)*exp(-(1-N/2)^2/alpha);
end

for n=1:N
    filter(n)=-(n-N/2)*exp(-(n-N/2)^2/alpha);   % d/dt of a gaussian
end
filter=filter/sum(abs(filter));     % normalization

return







