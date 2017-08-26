function varargout = mainexe(varargin)
% MAINEXE MATLAB code for mainexe.fig
%      MAINEXE, by itself, creates a new MAINEXE or raises the existing
%      singleton*.
%
%      H = MAINEXE returns the handle to a new MAINEXE or the handle to
%      the existing singleton*.
%
%      MAINEXE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINEXE.M with the given input arguments.
%
%      MAINEXE('Property','Value',...) creates a new MAINEXE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainexe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainexe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainexe

% Last Modified by GUIDE v2.5 07-Aug-2017 15:13:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainexe_OpeningFcn, ...
                   'gui_OutputFcn',  @mainexe_OutputFcn, ...
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


% --- Executes just before mainexe is made visible.
function mainexe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainexe (see VARARGIN)

% Choose default command line output for mainexe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainexe wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainexe_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.xlsx';},'请选择需要分析的xlsx格式的数据文件');
 File_name=[pathname,filename];
 
 [~, ~, adress] = xlsread(File_name,'C3:O3');
adress(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),adress)) = {''};
adress=adress'
% 分别读入文件头基因频率数据，作为权重。
% 目锟斤拷锟斤拷为锟剿伙拷锟饺拷亍锟?
[~, ~, raw0_0] = xlsread(File_name,'1','B4:B14'); 
[~, ~, raw1_0] =xlsread(File_name,'1','B18:B44'); 
[~, ~, raw2_0] =xlsread(File_name,'1','B48:B65'); 
[~, ~, raw3_0] =xlsread(File_name,'1','B69:B80'); 
[~, ~, raw4_0] =xlsread(File_name,'1','B84:B97'); 
[~, ~, raw5_0] =xlsread(File_name,'1','B101:B111'); 
[~, ~, raw6_0] =xlsread(File_name,'1','B115:B125'); 
[~, ~, raw7_0] =xlsread(File_name,'1','B129:B139'); 
[~, ~, raw8_0] =xlsread(File_name,'1','B143:B160'); 
[~, ~, raw9_0] =xlsread(File_name,'1','B164:B182'); 
[~, ~, raw10_0] =xlsread(File_name,'1','B186:B197'); 
[~, ~, raw11_0] =xlsread(File_name,'1','B201:B227'); 
[~, ~, raw12_0] =xlsread(File_name,'1','B231:B258'); 
raw =[raw0_0;raw1_0;raw2_0;raw3_0;raw4_0;raw5_0;raw6_0;raw7_0;raw8_0;raw9_0;raw10_0;raw11_0;raw12_0;];
w = reshape([raw{:}],size(raw)); 
clearvars raw raw0_0 raw1_0 raw2_0 raw3_0 raw4_0 raw5_0 raw6_0 raw7_0 raw8_0 raw9_0 raw10_0 raw11_0 raw12_0;
%% 锟斤拷锟斤拷parent gene 锟斤拷adressans

B_Northeast = importfile_new(File_name,'1','Q4:T258');
B_Southeast = importfile_new(File_name, '1','V4:X258');
B_SouthAsia = importfile_new(File_name, '1','Z4:AD258');
B_WestAsia = importfile_new(File_name, '1','AF4:AH258');

A_Tibetan = importfile_new(File_name,'1','C4:O258');
A_Tibetan(isnan(A_Tibetan))=0;
B1=(mean(B_Northeast'))';
B2=(mean(B_Southeast'))';
B3=(mean(B_SouthAsia'))';
B4=(mean(B_WestAsia'))';
B=[B1,B2,B3,B4];
B(isnan(B))=0;
Asia_title={'Northeast','Southeast','southAsia','WestAsia'};
x=zeros(10,4);
std=zeros(10,4);
mse=zeros(10,4);
for i=1:size(A_Tibetan,2);
A=A_Tibetan(:,i);
[x(i,:),std(i,:),mse(i,:)] = lscov(B,A,w);
end
S=ones(size(x)).*min(min(x));
x=x+(-S)
sumx=sum(x');
for i=1:size(x)
x(i,:)=x(i,:)./sumx(i);
end
handles.A_Tibetan=A_Tibetan
handles.b=B
handles.adress=adress;
handles.Asia_title=Asia_title;
handles.x=x;
handles.std=std;
handles.mse=mse;


guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A_Tibetan=handles.A_Tibetan;
B=handles.b;
adress=handles.adress;
Asia_title=handles.Asia_title;

xdata=[A_Tibetan,B];
[score,loading,cancha]=pca(xdata);
title=[adress' Asia_title];
axes(handles.axes1);
scatter(score(1,:),score(2,:));
gname(title);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
fileID = fopen('ztq.txt','wt');
% for i =1 : 9
% formatSpec = 'X is %4.2f meters or %8.3f mm\n';
Asia_title=handles.Asia_title;
adress=handles.adress;
std=handles.std;
mse=handles.mse;


fprintf(fileID, '%18s\t %18s\t %18s\t %18s\t\n' , Asia_title{1:4} );
formatspec='   \t%5.3f +_%5.3f\t ';
x=handles.x;

for i=1:size(x,1)
    fprintf(fileID,adress{i});
    for j=1:size(x,2)
          fprintf(fileID,formatspec,x(i,j),std(i,j));
    end
    fprintf(fileID,' \r\n');
end


% fprintf(fileID, formatspec, x,std);
fclose('all');
winopen('ztq.txt');
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
