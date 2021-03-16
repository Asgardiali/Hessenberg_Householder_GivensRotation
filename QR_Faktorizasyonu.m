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

%Baþlangýçta matrisi boþ olarak tanýmladým tüm deðerlerini sýfýr verdim.
H=zeros(t,t);
%Matrisin tümdeðerlerine ulaþýlarak, istenilen rastgele gürültüleri
%oluþturdum. Daha sonra kullanýcý tarafýndan girilen konum bilgilerine göre
%mesafe ölçümü yapýlarak matris tekrardan güncellenecektir.
for k=1:1:t
    for i=1:1:t
        if(mod(i,2)==1 && mod(k,2)==1)
            %Uniform daðýlýmý temsil etmek için 0-1 arasýnda rastgele sayý veren rand fonksiyonunu kullandým.
            H(k,i)=rand(1);
            continue;
        elseif(mod(i,2)==0 && mod(k,2)==0)
            %Normal daðýlýmý temsil etmek için randn (normal deðiþkene göre rastgele sayý üretiyor) fonksiyonunu kullandým.
            H(k,i)=abs(randn(1));
            continue;
        else
            H(k,i)=1;
            continue;           
        end
    end
end
%Buradan elde ettiðim H matris verilerini Excel'de denemesi yaptým. Ayný
%herhangi bir rastgele deðiþken gelmemektedir.
H=control(H);

mesafe=sqrt(((tx-rx)^2)+((ty-ry)^2));
%H matrisinin son hali olarak mesafe ile çarptým ve aþaðýdaki sonucu elde
%ettim. Ýstenilen tüm deðerlere göre bir hesap yapýlmýþ oldu.
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
