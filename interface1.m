function varargout = interface1(varargin)
% INTERFACE1 MATLAB code for interface1.fig
%      INTERFACE1, by itself, creates a new INTERFACE1 or raises the existing
%      singleton*.
%
%      H = INTERFACE1 returns the handle to a new INTERFACE1 or the handle to
%      the existing singleton*.
%
%      INTERFACE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE1.M with the given input arguments.
%
%      INTERFACE1('Property','Value',...) creates a new INTERFACE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface1

% Last Modified by GUIDE v2.5 03-Jun-2015 23:57:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface1_OpeningFcn, ...
                   'gui_OutputFcn',  @interface1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interface1 is made visible.
function interface1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface1 (see VARARGIN)

% Choose default command line output for interface1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in note_numb.
function note_numb_Callback(hObject, eventdata, handles)
% hObject    handle to note_numb (see GCBO)

 snote_numb= get(hObject, 'String');
save('filename1', 'snote_numb');
draw;
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function note_numb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to note_numb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
interface2;