function varargout = interface3(varargin)
% INTERFACE3 MATLAB code for interface3.fig
%      INTERFACE3, by itself, creates a new INTERFACE3 or raises the existing
%      singleton*.
%
%      H = INTERFACE3 returns the handle to a new INTERFACE3 or the handle to
%      the existing singleton*.
%
%      INTERFACE3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE3.M with the given input arguments.
%
%      INTERFACE3('Property','Value',...) creates a new INTERFACE3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface3

% Last Modified by GUIDE v2.5 27-May-2015 10:42:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface3_OpeningFcn, ...
                   'gui_OutputFcn',  @interface3_OutputFcn, ...
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


% --- Executes just before interface3 is made visible.
function interface3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface3 (see VARARGIN)

% Choose default command line output for interface3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function notes_Callback(hObject, eventdata, handles)
% hObject    handle to notes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of notes as text
%        str2double(get(hObject,'String')) returns contents of notes as a double


% --- Executes during object creation, after setting all properties.
function notes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to notes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
load('final1', 'final');
set ( hObject, 'String' ,final) 
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
