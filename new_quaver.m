
load('filename', 'str');
input=str;
z=audioread(input);
final=' ';
 points = timeout(z,44100);

note=1;factor=1;
zz=z*0;

while(note<length(points))
    x=z(points(note):points(note+1));
         
     [freq,amp]=compile2(x);
    qf=freqtonote(freq);
  sf=strcat('__',qf);

  final=strcat(final,sf);
  
  sin_note=artificial(length(x),freq,amp,factor);

  z(points(note):points(note+1))=sin_note;
  zz(points(note):points(note+1))=sin_note;
  

  note=note+1;
end

save('final1', 'final');

fileID=fopen('NOTES.txt','w');
fprintf(fileID,'%s',final);
fclose(fileID);

output1='output.wav';
%audiowrite(output,zz,44100);
audiowrite(output1,zz,44100);