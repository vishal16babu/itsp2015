load('filename', 'str');
input=str;
z=audioread(input);
abc=0;
final=' ';

z=audioread(input);

[max_notes, min_notes]=tofindnoteduration(z);
note=1;factor=1;
zz=z*0;

while(note<=length(max_notes))
    %fprintf('note number %d \n',note);
    x=z(max_notes(note):min_notes(note));
    points = timeout(x,44100);
    
    
     fprintf('haha');
subnote=1;
start=1;
cons=5;
while(subnote<=length(points) )
    if(points(subnote)>length(x)-round(length(x)/cons))
        fprintf('huhu');
        break;
    end
    if(points(subnote)>round(length(x)/cons)  )
    %fprintf(' ---> \n  subnote number %d \n',subnote);
    xx=x(start:points(subnote));
    
     [freq,amp]=compile(xx,note,subnote);
    
  sin_note=artificial(length(xx),freq,amp,factor);

  zz(max_notes(note)+start-1:max_notes(note)+points(subnote)-1)=sin_note;
  if(subnote<length(points))
start=points(subnote+1);
  end
    end
  subnote=subnote+1;
end
if(isempty(points)||subnote==1)
    start=1;
else
    start=points(subnote-1);
    
end
if(start~=length(x))
    %fprintf(' ---> \n  subnote number %d \n',subnote);
    xx=x(start:length(x));
     
     [freq,amp]=compile(xx,note,subnote);
     
    qf=freqtonote(freq);
  sf=strcat('__',qf);
  final=strcat(final,sf);
    
  sin_note=artificial(length(xx),freq,amp,factor);

  zz(max_notes(note)+start-1:max_notes(note)+length(x)-1)=sin_note;
end

  note=note+1;
end
sound(zz,44100);
output=strcat('art_',input);
audiowrite(output,zz,44100);

fileID=fopen('NOTES.txt','w');
fprintf(fileID,'%s',final);
fclose(fileID);

final

output1='output.wav';
audiowrite(output1,zz,44100);