function varargout = QR_Faktorizasyonu(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @QR_Faktorizasyonu_OpeningFcn, ...
                   'gui_OutputFcn',  @QR_Faktorizasyonu_OutputFcn, ...
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

function QR_Faktorizasyonu_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = QR_Faktorizasyonu_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function antennasNumber_Callback(hObject, eventdata, handles)

function antennasNumber_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function rx_Callback(hObject, eventdata, handles)

function rx_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function tx_Callback(hObject, eventdata, handles)

function tx_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ry_Callback(hObject, eventdata, handles)

function ry_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ty_Callback(hObject, eventdata, handles)

function ty_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculate_Callback(hObject, eventdata, handles)

t=str2double(get(handles.antennasNumber,'string'));
rx=str2double(get(handles.rx,'string'));
ry=str2double(get(handles.ry,'string'));
tx=str2double(get(handles.tx,'string'));
ty=str2double(get(handles.ty,'string'));

%Ba�lang��ta matrisi bo� olarak tan�mlad�m t�m de�erlerini s�f�r verdim.
H=zeros(t,t);
%Matrisin t�mde�erlerine ula��larak, istenilen rastgele g�r�lt�leri
%olu�turdum. Daha sonra kullan�c� taraf�ndan girilen konum bilgilerine g�re
%mesafe �l��m� yap�larak matris tekrardan g�ncellenecektir.
for k=1:1:t
    for i=1:1:t
        if(mod(i,2)==1 && mod(k,2)==1)
            %Uniform da��l�m� temsil etmek i�in 0-1 aras�nda rastgele say� veren rand fonksiyonunu kulland�m.
            H(k,i)=rand(1);
            continue;
        elseif(mod(i,2)==0 && mod(k,2)==0)
            %Normal da��l�m� temsil etmek i�in randn (normal de�i�kene g�re rastgele say� �retiyor) fonksiyonunu kulland�m.
            H(k,i)=abs(randn(1));
            continue;
        else
            H(k,i)=1;
            continue;           
        end
    end
end
%Buradan elde etti�im H matris verilerini Excel'de denemesi yapt�m. Ayn�
%herhangi bir rastgele de�i�ken gelmemektedir.
H=control(H);

mesafe=sqrt(((tx-rx)^2)+((ty-ry)^2));
%H matrisinin son hali olarak mesafe ile �arpt�m ve a�a��daki sonucu elde
%ettim. �stenilen t�m de�erlere g�re bir hesap yap�lm�� oldu.
H=mesafe*H;
%Hessenberg Matrisi elde edildi.
Hessenberg=House_sim_to_Hess(H);
set(handles.hessenberg,'data',Hessenberg);
%Householder ile Q ve R matrisi elde edildi.
[Q,R]=QR_factor(H);
set(handles.householderQ,'data',Q);
set(handles.householderR,'data',R);
%Givens rotasyonu ile Q ve R matrisi elde edildi
[Q,R]=QR_factor_Hess(Hessenberg);
set(handles.givensQ,'data',Q);
set(handles.givensR,'data',R);
