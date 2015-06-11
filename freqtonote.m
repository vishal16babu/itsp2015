function str= freqtonote(freq)
n = round(12*log(freq/27.5)/log(2));
            switch mod(n,12)
                case 0
                    str = 'A ';
                case 1
                    str = 'A#/Bb ';
                case 2 
                    str = 'B ';
                case 3 
                    str = 'C ';
                case 4 
                    str = 'C#/Db ';
                case 5 
                    str = 'D ';
                case 6 
                    str = 'D#/Eb ';
                case 7 
                    str = 'E ';
                case 8 
                    str = 'F ';
                case 9 
                    str = 'F#/Gb ';
                case 10 
                    str = 'G ';
                case 11 
                    str = 'G#/Ab ';
                otherwise
                    str='note not detected';
            end        

