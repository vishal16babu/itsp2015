function varargout = interface_tuning(varargin)
% INTERFACE_TUNING MATLAB code for interface_tuning.fig
%      INTERFACE_TUNING, by itself, creates a new INTERFACE_TUNING or raises the existing
%      singleton*.
%
%      H = INTERFACE_TUNING returns the handle to a new INTERFACE_TUNING or the handle to
%      the existing singleton*.
%
%      INTERFACE_TUNING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE_TUNING.M with the given input arguments.
%
%      INTERFACE_TUNING('Property','Value',...) creates a new INTERFACE_TUNING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_tuning_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_tuning_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface_tuning

% Last Modified by GUIDE v2.5 04-Jun-2015 00:05:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_tuning_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_tuning_OutputFcn, ...
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


% --- Executes just before interface_tuning is made visible.
function interface_tuning_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface_tuning (see VARARGIN)

% Choose default command line output for interface_tuning
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface_tuning wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_tuning_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in auto_tuning.
function auto_tuning_Callback(hObject, eventdata, handles)
% hObject    handle to auto_tuning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('filename', 'str');
input=str;
data=audioread(input);
data=abs(data);
[~,c]=min(-data);
n=data(c);
strm=num2str(n);
save('datamax', 'strm');
new_quaver;

close(handles.output);
interface2;


% --- Executes on button press in manual_tuning.
function manual_tuning_Callback(hObject, eventdata, handles)
% hObject    handle to manual_tuning (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(handles.output);
interface_manual;


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
interface;
