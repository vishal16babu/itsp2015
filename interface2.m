function varargout = interface2(varargin)
% INTERFACE2 MATLAB code for interface2.fig
%      INTERFACE2, by itself, creates a new INTERFACE2 or raises the existing
%      singleton*.
%
%      H = INTERFACE2 returns the handle to a new INTERFACE2 or the handle to
%      the existing singleton*.
%
%      INTERFACE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE2.M with the given input arguments.
%
%      INTERFACE2('Property','Value',...) creates a new INTERFACE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface2

% Last Modified by GUIDE v2.5 04-Jun-2015 00:05:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface2_OpeningFcn, ...
                   'gui_OutputFcn',  @interface2_OutputFcn, ...
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


% --- Executes just before interface2 is made visible.
function interface2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface2 (see VARARGIN)

% Choose default command line output for interface2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in GRAPHS.
function GRAPHS_Callback(hObject, eventdata, handles)
% hObject    handle to GRAPHS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
interface1;

% --- Executes on button press in allnotes.
function allnotes_Callback(hObject, eventdata, handles)
% hObject    handle to allnotes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
interface3;


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
out='output.wav';
y=audioread(out);
sound(y,44100);


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
interface_tuning;
