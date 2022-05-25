function varargout = EQUALIZER(varargin)
% EQUALIZER MATLAB code for EQUALIZER.fig
%      EQUALIZER, by itself, creates a new EQUALIZER or raises the existing
%      singleton*.
%
%      H = EQUALIZER returns the handle to a new EQUALIZER or the handle to
%      the existing singleton*.
%
%      EQUALIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EQUALIZER.M with the given input arguments.
%
%      EQUALIZER('Property','Value',...) creates a new EQUALIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EQUALIZER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EQUALIZER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EQUALIZER

% Last Modified by GUIDE v2.5 21-Jun-2021 21:35:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EQUALIZER_OpeningFcn, ...
                   'gui_OutputFcn',  @EQUALIZER_OutputFcn, ...
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


% --- Executes just before EQUALIZER is made visible.
function EQUALIZER_OpeningFcn(hObject, ~, handles, varargin) %%opening Fcn la phan de khoi tao bien
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EQUALIZER (see VARARGIN)

% Choose default command line output for EQUALIZER

handles.output = hObject;
% Update handles structure cap nhat lai giao dien GUI và function
guidata(hObject, handles);

% UIWAIT makes EQUALIZER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EQUALIZER_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) handles : là m?t c?u trúc ch?a t?t c? các ði?u khi?n và d? li?u ngý?i dùng. Dùng cái này ð? truy su?t các ði?u khi?n khác.


% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Browse.
function Browse_Callback(hObject, eventdata, handles) %Hàm ‘Callback’ là mot to hop lenh, chúng se ðýoc thuc thi khi mà ngýoi dùng nhap lên button hoac làm mot thao tác j ðó voi ðoi týong mà ban ða lôi vào màn hinh
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.wav'},'Select a File'); %lay thu muc trong 1 file cu the 
handles.fullpathname = strcat(pathname, filename);

set(handles.Address, 'String',handles.fullpathname) %hien thi duong dan day du 
guidata(hObject,handles)
%% manual
function play_EQUALIZER(hObject,handles)
global player;
[handles.y,handles.Fs] = audioread(handles.fullpathname); 
handles.f = awgn(handles.y,10,'measured');
%audioread la cho chay doan nhac 
handles.volume=get(handles.volume,'value');
handles.g1=get(handles.slider1,'value'); %get la lay gia tri
handles.g2=get(handles.slider2,'value');
handles.g3=get(handles.slider3,'value');
handles.g4=get(handles.slider11,'value');
handles.g5=get(handles.slider8,'value');
handles.g6=get(handles.slider7,'value');
handles.g7=get(handles.slider6,'value');
handles.g8=get(handles.slider10,'value');
handles.g9=get(handles.slider9,'value');
handles.g10=get(handles.slider4,'value');
set(handles.text24, 'String',handles.g1);
%tham so dau tien la doi tuong can chuyen doi, tham so thu 2 la thuoc tinh,
%tham so thu 3 la doi tuong muon lay
set(handles.text34, 'String',handles.g2);
set(handles.text35, 'String',handles.g3);
set(handles.text41, 'String',handles.g4);
set(handles.text36, 'String',handles.g5);
set(handles.text37, 'String',handles.g6);
set(handles.text38, 'String',handles.g7);
set(handles.text39, 'String',handles.g8);
set(handles.text40, 'String',handles.g9);
set(handles.text42, 'String',handles.g10);
%lowpass
Fc = 200;
N = 16;
a=fir1(N,Fc/(handles.Fs/2),'low');
y1=handles.g1*filter(a,1,handles.f);
% %bandpass1
f1=201;
f2=400;
b1=fir1(N,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.f);
% %bandpass2
f3=401;
f4=800;
b2=fir1(N,[f3/(handles.Fs/2) f4/(handles.Fs/2)],'bandpass');
y3=handles.g3*filter(b2,1,handles.f);
% %bandpass3
f4=801;
f5=1500;
b3=fir1(N,[f4/(handles.Fs/2) f5/(handles.Fs/2)],'bandpass');
y4=handles.g4*filter(b3,1,handles.f);
% %bandpass4
f5=1501;
f6=3000;
b4=fir1(N,[f5/(handles.Fs/2) f6/(handles.Fs/2)],'bandpass');
y5=handles.g5*filter(b4,1,handles.f);
% %bandpass5
f7=3001;
f8=5000;
b5=fir1(N,[f7/(handles.Fs/2) f8/(handles.Fs/2)],'bandpass');
y6=handles.g6*filter(b5,1,handles.f);
% %bandpass6
f9=5001;
f10=7000;
b6=fir1(N,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
y7=handles.g7*filter(b6,1,handles.f);
% %bandpass7
f11=7001;
f12=10000;
b7=fir1(N,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
y8=handles.g8*filter(b7,1,handles.f); 
% %bandpass8
f13=10001;
f14=15000;
b8=fir1(N,[f13/(handles.Fs/2) f14/(handles.Fs/2)],'bandpass');
y9=handles.g9*filter(b8,1,handles.f); 
%highpass
Fc2=15000;
c=fir1(N,Fc2/(handles.Fs/2),'high');
y10=handles.g10*filter(c,1,handles.f);
handles.yT=y1+y2+y3+y4+y5+y6+y7+y8+y9+y10;
player = audioplayer(handles.volume*handles.yT, handles.Fs);
%phat doan nhac sau chinh sua bang audioplayer và dat thanh bien player
L=length(handles.y);
n_fft=2^nextpow2(L);
y_fft0=fft(handles.y,n_fft);
y_f=y_fft0(1:n_fft/2);
x_fft=handles.Fs*(0:n_fft/2-1)/n_fft;
%nhac ban dau chuyen qua mien tan so
G=length(handles.f);
g_fft=2^nextpow2(G);
g_fft0=fft(handles.f,g_fft);
g_f=g_fft0(1:g_fft/2);
g_fft=handles.Fs*(0:g_fft/2-1)/g_fft;
%them nhieu trang va chuyen qua mien tan so
A = length(handles.yT);
m_fft=2^nextpow2(A);
out_fft0=fft(handles.yT,m_fft);
out_f=out_fft0(1:m_fft/2);
mx_fft=handles.Fs*(0:m_fft/2-1)/m_fft;
%sau khi loc va chuyen qua mien tan so
 subplot(3,2,1);
 plot(handles.y);
 subplot(3,2,2);
 plot(x_fft,abs(y_f));
 subplot(3,2,3);
 plot(handles.f);
 subplot(3,2,4);
 plot(g_fft,abs(g_f));
 subplot(3,2,5);
 plot(handles.yT);
 subplot(3,2,6);
 plot(mx_fft,abs(out_f));
guidata(hObject,handles)

% --- Executes on button press in resume.
function resume_Callback(hObject, eventdata, handles)
% hObject    handle to resume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_EQUALIZER(hObject, handles);
resume(player);
guidata(hObject, handles)

% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_EQUALIZER(hObject, handles);
pause(player);
guidata(hObject, handles)

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_EQUALIZER(hObject, handles);
stop(player);
guidata(hObject, handles)


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
global player;
play_EQUALIZER(hObject, handles);
play(player);
guidata(hObject, handles)

% --- Executes on slider movement.
function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Pop.
%% auto dieu chinh nhac theo set up
function Pop_Callback(hObject, eventdata, handles)
% hObject    handle to Pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = -1.5;
g2 = 3.9;
g3 = 5.4;
g4 = 4.5;
g5 =  0.9;
g6 = -1.5;
g7 = -1.8;
g8= -2.1;
g9 = -2.1;
g10 = -0.3;
set(handles.slider1,'value',g1);
set(handles.slider2,'value',g2);
set(handles.slider3,'value',g3);
set(handles.slider11,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider7,'value',g6);
set(handles.slider6,'value',g7);
set(handles.slider10,'value',g8);
set(handles.slider9,'value',g9);
set(handles.slider4,'value',g10);
set(handles.text24, 'String',g1);
set(handles.text34, 'String',g2);
set(handles.text35, 'String',g3);
set(handles.text41, 'String',g4);
set(handles.text36, 'String',g5);
set(handles.text37, 'String',g6);
set(handles.text38, 'String',g7);
set(handles.text39, 'String',g8);
set(handles.text40, 'String',g9);
set(handles.text42, 'String',g10);

% --- Executes on button press in Reaggae.
function Reaggae_Callback(hObject, eventdata, handles)
% hObject    handle to Reaggae (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 0;
g2 = 0;
g3 = -0.3;
g4 = -2.7;
g5 =  0;
g6 = 2.1;
g7 = 4.5;
g8= 3;
g9 = 0.6;
g10 = 0;
set(handles.slider1,'value',g1);
set(handles.slider2,'value',g2);
set(handles.slider3,'value',g3);
set(handles.slider11,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider7,'value',g6);
set(handles.slider6,'value',g7);
set(handles.slider10,'value',g8);
set(handles.slider9,'value',g9);
set(handles.slider4,'value',g10);

set(handles.text24, 'String',g1);
set(handles.text34, 'String',g2);
set(handles.text35, 'String',g3);
set(handles.text41, 'String',g4);
set(handles.text36, 'String',g5);
set(handles.text37, 'String',g6);
set(handles.text38, 'String',g7);
set(handles.text39, 'String',g8);
set(handles.text40, 'String',g9);
set(handles.text42, 'String',g10);

% --- Executes on button press in Rock.
function Rock_Callback(hObject, eventdata, handles)
% hObject    handle to Rock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 4.5;
g2 = -3.6;
g3 = -6.6;
g4 = -2.7;
g5 =  2.1;
g6 = 6;
g7 = 7.5;
g8= 7.8;
g9 =7.8;
g10 = 8.1;
set(handles.slider1,'value',g1);
set(handles.slider2,'value',g2);
set(handles.slider3,'value',g3);
set(handles.slider11,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider7,'value',g6);
set(handles.slider6,'value',g7);
set(handles.slider10,'value',g8);
set(handles.slider9,'value',g9);
set(handles.slider4,'value',g10);

set(handles.text24, 'String',g1);
set(handles.text34, 'String',g2);
set(handles.text35, 'String',g3);
set(handles.text41, 'String',g4);
set(handles.text36, 'String',g5);
set(handles.text37, 'String',g6);
set(handles.text38, 'String',g7);
set(handles.text39, 'String',g8);
set(handles.text40, 'String',g9);
set(handles.text41, 'String',g10);

% --- Executes on button press in Techno.
function Techno_Callback(hObject, eventdata, handles)
% hObject    handle to Techno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 4.8;
g2 = 4.2;
g3 = 1.5;
g4 = -2.4;
g5 =  -3.3;
g6 = -1.5;
g7 = 1.5;
g8= 5.1;
g9 = 5.7;
g10 = 5.4;
set(handles.slider1,'value',g1);
set(handles.slider2,'value',g2);
set(handles.slider3,'value',g3);
set(handles.slider11,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider7,'value',g6);
set(handles.slider6,'value',g7);
set(handles.slider10,'value',g8);
set(handles.slider9,'value',g9);
set(handles.slider4,'value',g10);

set(handles.text24, 'String',g1);
set(handles.text34, 'String',g2);
set(handles.text35, 'String',g3);
set(handles.text41, 'String',g4);
set(handles.text36, 'String',g5);
set(handles.text37, 'String',g6);
set(handles.text38, 'String',g7);
set(handles.text39, 'String',g8);
set(handles.text40, 'String',g9);
set(handles.text42, 'String',g10);

% --- Executes on button press in Party.
function Party_Callback(hObject, eventdata, handles)
% hObject    handle to Party (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 5.4;
g2 = 0;
g3 = 0;
g4 = 0;
g5 =  0;
g6 = 0;
g7 = 0;
g8= 0;
g9 = 0;
g10 = 5.4;
set(handles.slider1,'value',g1);
set(handles.slider2,'value',g2);
set(handles.slider3,'value',g3);
set(handles.slider11,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider7,'value',g6);
set(handles.slider6,'value',g7);
set(handles.slider10,'value',g8);
set(handles.slider9,'value',g9);
set(handles.slider4,'value',g10);

set(handles.text24, 'String',g1);
set(handles.text34, 'String',g2);
set(handles.text35, 'String',g3);
set(handles.text41, 'String',g4);
set(handles.text36, 'String',g5);
set(handles.text37, 'String',g6);
set(handles.text38, 'String',g7);
set(handles.text39, 'String',g8);
set(handles.text40, 'String',g9);
set(handles.text42, 'String',g10);


% --- Executes on button press in Classic.
function Classic_Callback(hObject, eventdata, handles)
% hObject    handle to Classic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g1 = 0;
g2 = 0;
g3 = 0;
g4 = 0;
g5 =  0;
g6 = 0;
g7 = -0.3;
g8= -5.7;
g9 = -6;
g10 = -8.1;
set(handles.slider1,'value',g1);
set(handles.slider2,'value',g2);
set(handles.slider3,'value',g3);
set(handles.slider11,'value',g4);
set(handles.slider8,'value',g5);
set(handles.slider7,'value',g6);
set(handles.slider6,'value',g7);
set(handles.slider10,'value',g8);
set(handles.slider9,'value',g9);
set(handles.slider4,'value',g10);

set(handles.text24, 'String',g1);
set(handles.text34, 'String',g2);
set(handles.text35, 'String',g3);
set(handles.text41, 'String',g4);
set(handles.text36, 'String',g5);
set(handles.text37, 'String',g6);
set(handles.text38, 'String',g7);
set(handles.text39, 'String',g8);
set(handles.text40, 'String',g9);
set(handles.text42, 'String',g10);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in addnoise.
function addnoise_Callback(hObject, eventdata, handles)
% hObject    handle to addnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.f, 'String', handles.y);

% --- Executes on button press in stopnoise.
function stopnoise_Callback(hObject, eventdata, handles)
% hObject    handle to stopnoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
