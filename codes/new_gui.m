function varargout = new_gui(varargin)
    
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
                       'gui_Singleton',  gui_Singleton, ...
                       'gui_OpeningFcn', @new_gui_OpeningFcn, ...
                       'gui_OutputFcn',  @new_gui_OutputFcn, ...
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

function new_gui_OpeningFcn(hObject, eventdata, handles, varargin)

    handles.output = hObject;

    guidata(hObject, handles);
    global x;
    x = 1;
    
    global X;
    X=[];
    
    global Y;
    Y=[];
    
    global eqn_X;
    eqn_X = '';
    
    global eqn_Y;
    eqn_Y = '';
    
    global fileName;
    fileName = '';
    
    global text;
    text = [];
    
    global data;
    data = [];
    
    global leg_array;
    leg_array = [];
    
    %to set up word document
    
    dicxLocator = fullfile(cd, 'sine.docx');
    word = actxserver('word.application');
    word.Visible = true;
    document = word.Documents.Add();
    

function varargout = new_gui_OutputFcn(hObject, eventdata, handles) 

    varargout{1} = handles.output;


function popupmenuX1_Callback(hObject, eventdata, handles)


function popupmenuX1_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end

function popupmenuY1_Callback(hObject, eventdata, handles)



function popupmenuY1_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


function pushbuttonLoadXLS_Callback(hObject, eventdata, handles)
    
    [fname, pname, findex] = uigetfile('*');
    fpath = [pname,fname];
    handles.fileName = fpath;
    guidata(hObject, handles);
    setPopupmenuString(handles.popupmenuX1,eventdata,handles);
    %{
    setPopupmenuString(handles.popupmenuY1,eventdata,handles);
    setPopupmenuString(handles.popupmenuX2,eventdata,handles);
    setPopupmenuString(handles.popupmenuY2,eventdata,handles);
    %}
    
function setPopupmenuString(hObject,eventdata,handles)
    global text;
    global fileName;
    global data;
    
    fileName = handles.fileName;

    [data, text] = xlsread(fileName);
    %{
    [~, text] = xlsread(fileName,'E1:I102553');
    text = text(1,:);
    [~, text1] = xlsread(fileName,'Y1:AF102553');
    text1 = text1(1,:);
    text = horzcat(text, text1);
    %}
    
    text = text(1,:);
    set(hObject, 'string', text);
    
    set(handles.popupmenuY1,'string',text);
    set(handles.popupmenuX2,'string',text);
    set(handles.popupmenuY2,'string',text);
    set(handles.popupmenuZ,'string',text);

function [x,y,xname,yname] = readCol(fileName, xCol, yCol)
    global text;
    global data;
    %{
    [data, text] = xlsread(fileName,'E1:I102553');
    [ndata1, text1] = xlsread(fileName,'Y1:AF102553');

    data = horzcat(data, ndata1);
    text = horzcat(text, text1);

    text = text(1,:);
    %}
    xname = text(xCol);
    yname = text(yCol);

    x = data(:,xCol);
    y = data(:,yCol);

    
 
    
function updateAxes(hObject, eventdata, handles)
 
    global fileName;
    xCol = get(handles.popupmenuX1, 'value');
    yCol = get(handles.popupmenuY1, 'value');
    [x,y,xname,yname] = readCol(fileName, xCol, yCol);
    color = return_Color();
    hold on;
    plot(handles.axes1,x,y,color);
    [leg,obj,outh,outm] = legend(xname);
    legend_array = updataLegend(outm);
    xlabel(xname);
    ylabel(yname);
    legend(legend_array);
    

function updateAxes2(hObject, eventdata, handles)

    global fileName;
    xCol = get(handles.popupmenuX1, 'value');
    yCol = get(handles.popupmenuY1, 'value');
    [x,y,xname,yname] = readCol(fileName, xCol, yCol);
    color = return_Color();
    hold on;
    scatter(handles.axes1,x,y,color);
    [leg,obj,outh,outm] = legend(xname);
    legend_array = updataLegend(outm);
    xlabel(xname);
    ylabel(yname);
    legend(legend_array);
    
    
function updateAxes3(hObject, eventdata, handles)

    global fileName;
    xCol = get(handles.popupmenuX1, 'value');
    yCol = get(handles.popupmenuY1, 'value');
    [x,~,xname,~] = readCol(fileName, xCol, yCol);
     color = return_Color();
    hold on;
    plot(handles.axes1,x,color);
    [leg,obj,outh,outm] = legend(xname);
    xlabel(xname);
    ylabel('');
    legend_array = updataLegend(outm);
    legend(legend_array);
    
function updateAxes4(hObject, eventdata, handles)
 
    global fileName;
    global X;
    global Y;
    global eqn_X;
    global eqn_Y;
    color = return_Color();
    hold on;
    plot(handles.axes1,X,Y,color);
    [leg,obj,outh,outm] = legend(eqn_X);
    legend_array = updataLegend(outm);
    xlabel(eqn_X);
    ylabel(eqn_Y);
    legend(legend_array);

   
function updateAxes5(hObject, eventdata, handles)
 
    global fileName;
    global X;
    global Y;
    global eqn_X;
    global eqn_Y;
    zCol = get(handles.popupmenuZ, 'value');
    yCol = get(handles.popupmenuY1, 'value');
    [z,~,zname,~] = readCol(fileName, zCol, yCol);
    
    color = return_Color();
    %hold on;
    %figure;
    %set(handles.axes1);
    %rotate3d on;
    plot3(X,Y,z,color);
    [leg,obj,outh,outm] = legend(eqn_X);
    legend_array = updataLegend(outm);
    xlabel(eqn_X);
    ylabel(eqn_Y);
    zlabel(zname);
    legend(legend_array);
    
function popupmenuX2_Callback(hObject, eventdata, handles)


function popupmenuX2_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


function popupmenuY2_Callback(hObject, eventdata, handles)


function popupmenuY2_CreateFcn(hObject, eventdata, handles)

    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end


function pushbuttonPlot_Callback(hObject, eventdata, handles)

    updateAxes1(hObject, eventdata, handles);


function pushbuttonPlot_single_Callback(hObject, eventdata, handles)

    updateAxes(hObject, eventdata, handles);


function pushbuttonClear_Callback(hObject, eventdata, handles)

    global leg_array;
    reset(handles.axes1);
    cla(handles.axes1);
    leg_array = [];
    legend('hide');


function pushbuttonScatter_Callback(hObject, eventdata, handles)

    updateAxes2(hObject, eventdata, handles);


% --------------------------------------------------------------------
function ax1_Callback(hObject, eventdata, handles)

    %rotate3d off;
    axes1fig = figure;
    axes1copy = copyobj(handles.axes1,axes1fig);
    set(axes1copy,'Units','Normalized',...
                  'Position',[.05,.20,.90,.60])
    handles.axes1fig = axes1fig;
    handles.axes1copy = axes1copy;
    legend_array = updataLegend([]);
    legend(legend_array);
    
    print(gcf, '-dmeta');
    h = actxGetRunningServer('word.Application');
    %disp(['Pasting in ' h.ActiveDocument.Name]);
    h.selection.PasteSpecial(0,0,1,0,3);
    h.selection.ShapeRange.Width = 1*380;
    h.selection.ShapeRange.ConvertToInlineShape;
    h.selection.Start = h.selection.Start+1;
    h.selection.End = h.selection.End +1;
    
    
    guidata(hObject,handles);

function pushbuttonPlotX1_Callback(hObject, eventdata, handles)

    updateAxes3(hObject, eventdata, handles);



% --- Executes on button press in pushbuttonRandom.
function pushbuttonRandom_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRandom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function color = return_Color()

colors = ['c', 'm', 'y', 'r' ,'g', 'b','k'];
global x;
if(x < 7)
    color = colors(x);
else 
    x = 1;
    color = colors(1);
end
x = x+1;


function legend_array = updataLegend(leg_arr)
global leg_array;
leg_array = horzcat(leg_array,leg_arr);
legend_array = leg_array;



function fy_Callback(hObject, eventdata, handles)
    global eqn_Y;
    f_y = get(hObject,'String');
    eqn_Y = f_y;
    %d = eval(f_x);
    % Hints: get(hObject,'String') returns contents of fy as text
    %         str2double(get(hObject,'String')) returns contents of fy as a double


% --- Executes during object creation, after setting all properties.
function fy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fx_Callback(hObject, eventdata, handles)
    
    global eqn_X;
    f_x = get(hObject,'String');
    eqn_X = f_x;
% Hints: get(hObject,'String') returns contents of fx as text
%        str2double(get(hObject,'String')) returns contents of fx as a double


% --- Executes during object creation, after setting all properties.
function fx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function evaluate(hObject, eventdata, handles)

    global X;
    global Y;
    global eqn_X;
    global eqn_Y;
    global fileName;
%load all values of X1,X2,Y1,Y2
    xCol1 = get(handles.popupmenuX1, 'value');
    yCol1 = get(handles.popupmenuY1, 'value');

    xCol2 = get(handles.popupmenuX2, 'value');
    yCol2 = get(handles.popupmenuY2, 'value');

    [X1,Y1,~,~] = readCol(fileName, xCol1, yCol1);
    [X2,Y2,~,~] = readCol(fileName, xCol2, yCol2);
    %fy = str2double(get(handles.fy,'String'))
    X = eval(eqn_X);
    Y = eval(eqn_Y);
    
    


% --- Executes on button press in pushbuttonXY.
function pushbuttonXY_Callback(hObject, eventdata, handles)

    evaluate(hObject, eventdata, handles);
    updateAxes4(hObject, eventdata, handles);


    


% --- Executes on selection change in popupmenuZ.
function popupmenuZ_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function popupmenuZ_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3D.
function pushbutton3D_Callback(hObject, eventdata, handles)
evaluate(hObject, eventdata, handles);
updateAxes5(hObject, eventdata, handles);


% --- Executes on button press in checkboxRotate.
function checkboxRotate_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxRotate
if get(hObject,'Value')
   % set(handles.hmesh,'Visible','on')
   rotate3d on;
else
   % set(handles.hmesh,'Visible','off')
   rotate3d off;
end
