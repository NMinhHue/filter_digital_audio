
function varargout = bai1(varargin)
% BAI1 MATLAB code for bai1.fig
%      BAI1, by itself, creates a new BAI1 or raises the existing
%      singleton*.
%
%      H = BAI1 returns the handle to a new BAI1 or the handle to
%      the existing singleton*.
%
%      BAI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BAI1.M with the given input arguments.
%
%      BAI1('Property','Value',...) creates a new BAI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bai1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bai1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bai1

% Last Modified by GUIDE v2.5 03-Jun-2022 15:10:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bai1_OpeningFcn, ...
                   'gui_OutputFcn',  @bai1_OutputFcn, ...
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


% --- Executes just before bai1 is made visible.
function bai1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bai1 (see VARARGIN)

% Choose default command line output for bai1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bai1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bai1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function Browse_Callback(hObject, eventdata, handles) %Hàm ‘Callback’ là mot to hop lenh, chúng se ðýoc thuc thi khi mà ngýoi dùng nhap lên button hoac làm mot thao tác j ðó voi ðoi týong mà ban ða lôi vào màn hinh
% hObject    handle to Browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname] = uigetfile({'*.mp3'; '*.m4a'},'Select a File'); %lay thu muc trong 1 file cu the 
handles.fullpathname = strcat(pathname, filename);
set(handles.Address, 'String',handles.fullpathname) %hien thi duong dan day du 
guidata(hObject,handles)

%% manual
function play_bai1(hObject,handles)
global player;
[handles.y,handles.Fs] = audioread(handles.fullpathname); 
handles.f = awgn(handles.y,10,'measured');
handles.volume = get(handles.volume,'value');
handles.g1=get(handles.slider1,'value'); %get la lay gia tri
handles.g2=get(handles.slider2,'value');
handles.g3=get(handles.slider3,'value');
handles.g4=get(handles.slider4,'value');
handles.g5=get(handles.slider5,'value');
handles.g6=get(handles.slider6,'value');
handles.g7=get(handles.slider7,'value');
handles.g8=get(handles.slider8,'value');
handles.g9=get(handles.slider9,'value');
handles.g10=get(handles.slider10,'value');

%tham so dau tien la doi tuong can chuyen doi, tham so thu 2 la thuoc tinh,
%tham so thu 3 la doi tuong muon lay
set(handles.text2, 'String',handles.g1);
set(handles.text3, 'String',handles.g2);
set(handles.text4, 'String',handles.g3);
set(handles.text5, 'String',handles.g4);
set(handles.text6, 'String',handles.g5);
set(handles.text7, 'String',handles.g6);
set(handles.text8, 'String',handles.g7);
set(handles.text9, 'String',handles.g8);
set(handles.text10, 'String',handles.g9);
set(handles.text11, 'String',handles.g10);

%lowpass
Fc = 200;
N = 16;
a=fir1(N,Fc/(handles.Fs/2),'low');
y1=handles.g1*filter(a,1,handles.f);

%bandpass1
f1=201;
f2=500;
b1=fir1(N,[f1/(handles.Fs/2) f2/(handles.Fs/2)],'bandpass');
y2=handles.g2*filter(b1,1,handles.f);

% %bandpass2
f3=501;
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
f10=8000;
b6=fir1(N,[f9/(handles.Fs/2) f10/(handles.Fs/2)],'bandpass');
y7=handles.g7*filter(b6,1,handles.f);

% %bandpass7
f11=8001;
f12=12000;
b7=fir1(N,[f11/(handles.Fs/2) f12/(handles.Fs/2)],'bandpass');
y8=handles.g8*filter(b7,1,handles.f); 

% %bandpass8
f13=12001;
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
% qua bo loc
L = length(handles.y);
n_fft=2^nextpow2(L);
y_fft0=fft(handles.y,n_fft);
y_f=y_fft0(1 : n_fft/2);
x_fft=handles.Fs*(0:n_fft/2-1)/n_fft;

%nhac ban dau chuyen qua mien tan so
G = length(handles.f);
g_fft = 2^nextpow2(G);
g_fft0 = fft(handles.f,g_fft);
g_f = g_fft0(1:g_fft/2);
g_fft = handles.Fs*(0:g_fft/2-1)/g_fft;

%them nhieu trang va chuyen qua mien tan so
A = length(handles.yT);
m_fft = 2^nextpow2(A);
out_fft0 = fft(handles.yT,m_fft);
out_f = out_fft0(1:m_fft/2);
mx_fft = handles.Fs*(0:m_fft/2-1)/m_fft;

%mien tan so
% organic
axes(handles.axes1);
plot(handles.y);

%  through filter
axes(handles.axes2);
plot(handles.yT);

compare = (handles.yT - handles.y);
% ham so sanh ??? 
 axes(handles.axes3);
 plot(compare);
% %  ?????


% axes(handles.axes2);
% plot(g_fft,abs(g_f));
% grid on;
%  %subplot(3,1,1);
%  %firuge(1);
%  %subplot(3,1,2);
%  axes(handles.axes2);
%  %firuge(2);
%  plot(handles.yT);
%  grid on;
%  %subplot(3,1,3);
%  axes(handles.axes3);
%  %firuge(3);
%  plot(mx_fft,abs(out_f));
%  grid on;
guidata(hObject,handles)

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
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
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


% --- Executes on button press in SPEAK.
 % >>SPEAK>>>
function SPEAK_Callback(hObject, eventdata, handles)
% hObject    handle to SPEAK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% recording = audiorecorder;
% disp('SPEAK....')
% recordblocking(recording, 5);
% disp('STOP....')
% play(recording);
% getaudiodata(recording);
% guidata(hObject,handles)

% --- Executes on button press in Start_add_noise.
function Start_add_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Start_add_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_bai1(hObject, handles);
Start_add_noise(player);
guidata(hObject, handles)

% --- Executes on button press in Stop_add_noise.
function Stop_add_noise_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_add_noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_bai1(hObject, handles);
Stop_add_noise(player);
guidata(hObject, handles)

% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_bai1(hObject, handles);
Play(player);
guidata(hObject, handles)

% --- Executes on button press in Stop.
function Stop_Callback(hObject, eventdata, handles)
% hObject    handle to Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
play_bai1(hObject, handles);
Stop(player);
guidata(hObject, handles)


% --- Executes on slider movement.
function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
