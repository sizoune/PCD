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

% Last Modified by GUIDE v2.5 28-Nov-2017 12:21:27

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



function edRowStart_Callback(hObject, eventdata, handles)
% hObject    handle to edRowStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edRowStart as text
%        str2double(get(hObject,'String')) returns contents of edRowStart as a double


% --- Executes during object creation, after setting all properties.
function edRowStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edRowStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edRowEnd_Callback(hObject, eventdata, handles)
% hObject    handle to edRowEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edRowEnd as text
%        str2double(get(hObject,'String')) returns contents of edRowEnd as a double


% --- Executes during object creation, after setting all properties.
function edRowEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edRowEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edColStart_Callback(hObject, eventdata, handles)
% hObject    handle to edColStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edColStart as text
%        str2double(get(hObject,'String')) returns contents of edColStart as a double


% --- Executes during object creation, after setting all properties.
function edColStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edColStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edColEnd_Callback(hObject, eventdata, handles)
% hObject    handle to edColEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edColEnd as text
%        str2double(get(hObject,'String')) returns contents of edColEnd as a double


% --- Executes during object creation, after setting all properties.
function edColEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edColEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rowstartS = get(handles.edRowStart, 'String');
rowendS = get(handles.edRowEnd, 'String');
colstartS = get(handles.edColStart, 'String');
colendS = get(handles.edColEnd, 'String');
rowstart = str2double(rowstartS);
rowend = str2double(rowendS);
colstart = str2double(colstartS);
colend = str2double(colendS);
if ~isempty(rowstart) && ~isempty(rowend) && ~isempty(colstart) && ~isempty(colend)
    image = getImage;
    croping = Croping(image,rowstart,rowend,colstart,colend);
    setImage(croping);
    imshow(croping);
else
    disp('data not completed yet');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
intensitas = Histogram(image);
label = (0:255);
bar(label, intensitas);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
row1a = str2double(get(handles.row1a, 'String'));
row1b = str2double(get(handles.row1b, 'String'));
row1c = str2double(get(handles.row1c, 'String'));

row2a = str2double(get(handles.row2a, 'String'));
row2b = str2double(get(handles.row2b, 'String'));
row2c = str2double(get(handles.row2c, 'String'));

row3a = str2double(get(handles.row3a, 'String'));
row3b = str2double(get(handles.row3b, 'String'));
row3c = str2double(get(handles.row3c, 'String'));

if ~isempty(row1a) && ~isempty(row1b) && ~isempty(row1c)&& ~isempty(row2a) && ~isempty(row2b) && ~isempty(row2c)&& ~isempty(row3a) && ~isempty(row3b) && ~isempty(row3c)
    kernel = [row1a row1b row1c; row2a row2b row2c; row3a row3b row3c];
    image = getImage;
    konv= Konvolusi(image,kernel);
    imshow(konv);
else
    disp('data not completed yet');
end

function row1a_Callback(hObject, eventdata, handles)
% hObject    handle to row1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row1a as text
%        str2double(get(hObject,'String')) returns contents of row1a as a double


% --- Executes during object creation, after setting all properties.
function row1a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row1a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row1b_Callback(hObject, eventdata, handles)
% hObject    handle to row1b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row1b as text
%        str2double(get(hObject,'String')) returns contents of row1b as a double


% --- Executes during object creation, after setting all properties.
function row1b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row1b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row1c_Callback(hObject, eventdata, handles)
% hObject    handle to row1c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row1c as text
%        str2double(get(hObject,'String')) returns contents of row1c as a double


% --- Executes during object creation, after setting all properties.
function row1c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row1c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row2a_Callback(hObject, eventdata, handles)
% hObject    handle to row2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row2a as text
%        str2double(get(hObject,'String')) returns contents of row2a as a double


% --- Executes during object creation, after setting all properties.
function row2a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row2a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row2b_Callback(hObject, eventdata, handles)
% hObject    handle to row2b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row2b as text
%        str2double(get(hObject,'String')) returns contents of row2b as a double


% --- Executes during object creation, after setting all properties.
function row2b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row2b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row2c_Callback(hObject, eventdata, handles)
% hObject    handle to row2c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row2c as text
%        str2double(get(hObject,'String')) returns contents of row2c as a double


% --- Executes during object creation, after setting all properties.
function row2c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row2c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row3a_Callback(hObject, eventdata, handles)
% hObject    handle to row3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row3a as text
%        str2double(get(hObject,'String')) returns contents of row3a as a double


% --- Executes during object creation, after setting all properties.
function row3a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row3a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row3b_Callback(hObject, eventdata, handles)
% hObject    handle to row3b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row3b as text
%        str2double(get(hObject,'String')) returns contents of row3b as a double


% --- Executes during object creation, after setting all properties.
function row3b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row3b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function row3c_Callback(hObject, eventdata, handles)
% hObject    handle to row3c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of row3c as text
%        str2double(get(hObject,'String')) returns contents of row3c as a double


% --- Executes during object creation, after setting all properties.
function row3c_CreateFcn(hObject, eventdata, handles)
% hObject    handle to row3c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
meanfilter = NoiseReduction(image,1);
setImage(meanfilter);
imshow(meanfilter);

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
meanfilter = NoiseReduction(image,2);
setImage(meanfilter);
imshow(meanfilter);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
meanfilter = NoiseReduction(image,3);
setImage(meanfilter);
imshow(meanfilter);


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kernel = [0 -1 0; -1 5 -1; 0 -1 0];
image = getImage;
konv= Konvolusi(image,kernel);
imshow(konv);

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];
image = getImage;
konv= Konvolusi(image,kernel);
imshow(konv);

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kernel = [0 1 0; 1 -4 1; 0 1 0];
image = getImage;
konv= Konvolusi(image,kernel);
setImage(konv);
imshow(konv);

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kernel = [1 0 -1; 0 0 0; -1 0 1];
image = getImage;
konv= Konvolusi(image,kernel);
setImage(konv);
imshow(konv);


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kernel = [1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
image = getImage;
konv= Konvolusi(image,kernel);
setImage(konv);
imshow(konv);

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
kernel = [1/16 2/16 1/16; 2/16 4/16 2/16; 1/16 2/16 1/16];
image = getImage;
konv= Konvolusi(image,kernel);
imshow(konv);



function editRed_Callback(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRed as text
%        str2double(get(hObject,'String')) returns contents of editRed as a double


% --- Executes during object creation, after setting all properties.
function editRed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGreen_Callback(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGreen as text
%        str2double(get(hObject,'String')) returns contents of editGreen as a double


% --- Executes during object creation, after setting all properties.
function editGreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBlue_Callback(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBlue as text
%        str2double(get(hObject,'String')) returns contents of editBlue as a double


% --- Executes during object creation, after setting all properties.
function editBlue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in doSegmentationThreshold.
function doSegmentationThreshold_Callback(hObject, eventdata, handles)
% hObject    handle to doSegmentationThreshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
redMin = str2double(get(handles.editRed, 'String'));
redMax = str2double(get(handles.editRed1, 'String'));
greenMin = str2double(get(handles.editGreen, 'String'));
greenMax = str2double(get(handles.editGreen1, 'String'));
blueMin = str2double(get(handles.editBlue, 'String'));
blueMax = str2double(get(handles.editBlue1, 'String'));
if ~isempty(redMin) && ~isempty(redMax) && ~isempty(greenMin) && ~isempty(greenMax) && ~isempty(blueMin) && ~isempty(blueMax)
    image = getImage;
    hasil = SegmentationThreshold(image,redMin,redMax,greenMin,greenMax,blueMin,blueMax);
    setImage(hasil);
    imshow(hasil);
else
    disp('data not completed yet');
end



function editRed1_Callback(hObject, eventdata, handles)
% hObject    handle to editRed1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRed1 as text
%        str2double(get(hObject,'String')) returns contents of editRed1 as a double


% --- Executes during object creation, after setting all properties.
function editRed1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRed1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGreen1_Callback(hObject, eventdata, handles)
% hObject    handle to editGreen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGreen1 as text
%        str2double(get(hObject,'String')) returns contents of editGreen1 as a double


% --- Executes during object creation, after setting all properties.
function editGreen1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGreen1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editBlue1_Callback(hObject, eventdata, handles)
% hObject    handle to editBlue1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBlue1 as text
%        str2double(get(hObject,'String')) returns contents of editBlue1 as a double


% --- Executes during object creation, after setting all properties.
function editBlue1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBlue1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in doGrwoth.
function doGrwoth_Callback(hObject, eventdata, handles)
% hObject    handle to doGrwoth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = str2double(get(handles.editXgrowth, 'String'));
y = str2double(get(handles.editYgrowth, 'String'));



function editXgrowth_Callback(hObject, eventdata, handles)
% hObject    handle to editXgrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editXgrowth as text
%        str2double(get(hObject,'String')) returns contents of editXgrowth as a double


% --- Executes during object creation, after setting all properties.
function editXgrowth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editXgrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editYgrowth_Callback(hObject, eventdata, handles)
% hObject    handle to editYgrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editYgrowth as text
%        str2double(get(hObject,'String')) returns contents of editYgrowth as a double


% --- Executes during object creation, after setting all properties.
function editYgrowth_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editYgrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnDilasi.
function btnDilasi_Callback(hObject, eventdata, handles)
% hObject    handle to btnDilasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
dilasi= Dilation(image);
setImage(dilasi);
imshow(dilasi);

% --- Executes on button press in btnErosi.
function btnErosi_Callback(hObject, eventdata, handles)
% hObject    handle to btnErosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = getImage;
erosi= Erotion(image);
setImage(erosi);
imshow(erosi);