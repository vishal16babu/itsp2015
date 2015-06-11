load('filename', 'str');
input=str;
z=audioread(input);

[max_notes, min_notes]=tofindnoteduration(z);
load('filename1', 'snote_numb');
note=str2num(snote_numb);
x=z(max_notes(note):min_notes(note));
plots(x,note);