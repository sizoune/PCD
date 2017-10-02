function varargout = OpenImage(varargin)
% OPENIMAGE MATLAB code for OpenImage.fig
%      OPENIMAGE, by itself, creates a new OPENIMAGE or raises the existing
%      singleton*.
%
%      H = OPENIMAGE returns the handle to a new OPENIMAGE or the handle to
%      the existing singleton*.
%
%      OPENIMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPENIMAGE.M with the given input arguments.
%
%      OPENIMAGE('Property','Value',...) creates a new OPENIMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before OpenImage_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to OpenImage_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help OpenImage

% Last Modified by GUIDE v2.5 02-Oct-2017 10:23:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @OpenImage_OpeningFcn, ...
    'gui_OutputFcn',  @OpenImage_OutputFcn, ...
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


% --- Executes just before OpenImage is made visible.
function OpenImage_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to OpenImage (see VARARGIN)

% Choose default command line output for OpenImage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes OpenImage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = OpenImage_OutputFcn(~, ~, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function image = getImage
global x;
image = x;

function setImage(value)
global x;
x = value;

function origin = getOriginImage
global y;
origin = y;

function setOriginImage(image)
global y;
y = image;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile({'*.jpg';'*.png'},'Image Selector');
if isequal(FileName,0)
    disp('User selected Cancel')
else
    disp(['User selected ', fullfile(PathName, FileName)]);
    %imshow(fullfile(PathName, FileName));
    citra = getMatrikfromPic(fullfile(PathName, FileName));
    setOriginImage(citra);
    setImage(citra);
    imshow(citra);
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
greyscale = changeImagetoGrayscale(image);
setImage(greyscale);
imshow(greyscale);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
brightness = setBrightness(image,1);
setImage(brightness);
imshow(brightness);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
brightness = setBrightness(image,2);
setImage(brightness);
imshow(brightness);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getOriginImage;
setImage(image);
imshow(image);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
hasil = moveImage(image,4);
setImage(hasil);
imshow(hasil);

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
hasil = moveImage(image,1);
setImage(hasil);
imshow(hasil);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
hasil = moveImage(image,2);
setImage(hasil);
imshow(hasil);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
hasil = moveImage(image,3);
setImage(hasil);
imshow(hasil);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
brightness = setBrightness(image,3);
setImage(brightness);
imshow(brightness);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
brightness = setBrightness(image,4);
setImage(brightness);
imshow(brightness);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = getImage;
hasil = ZoomInOut(gambar,2);
setImage(hasil);
cla(handles.axes4,'reset');
imshow(hasil, 'InitialMagnification', 100);

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gambar = getImage;
hasil = ZoomInOut(gambar,1);
setImage(hasil);
cla(handles.axes4,'reset');
imshow(hasil, 'InitialMagnification', 100);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
warping = Warping(image);
setImage(warping);
imshow(warping);