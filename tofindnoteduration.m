function [max_points, min_points]=tofindnoteduration(data)


load('datamax', 'strm');
M=str2num(strm);
data=abs(data);
[~,c]=min(-data);

data=data/M;
i=0;times=[];cons=1000;
while(i*cons+cons<=length(data))
    new_data=data(i*cons+1:i*cons+cons);
    [~,var]=min(-new_data);
    times(end+1)=var+i*cons;
    
    i=i+1;
end
i=2;max_points=[];find_max=true;min_points=[];
while(i<length(times))
    if(find_max && data(times(i))>0.5)
    max_points(end+1)=times(i);
        find_max=false;
    
    else if(not(find_max) && data(times(i))<0.5)
        min_points(end+1)=times(i);
        find_max=true;
        end
    end
    i=i+1;
    
    
end
if(length(max_points)-length(min_points)==1)
    min_points(end+1)=times(length(times));
    fprintf('ended with a note \n');
end

