function varargout = lru_format(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lru_format_OpeningFcn, ...
                   'gui_OutputFcn',  @lru_format_OutputFcn, ...
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


% --- Executes just before lru_format is made visible.
function lru_format_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global access;
access = 1;

global fileID;
fileID = 0;

global offset;
offset = 0;

global fileName;
fileName = '';

global dSize;
dSize = 0;

global data;
data=[];

global MSG_ID;
MSG_ID = '';

global From;
From = '';

global To;
To = '';

global Parameter_name;
Parameter_name = '';

global Start_word;
Start_word = 0;

global End_word;
End_word = 0;

global signed;
signed = 0;

global Start_bit;
Start_bit = 0;

global End_bit;
End_bit = 0;

global LSB;
LSB = 0;

global MSB;
MSB = 0;

global Unit;
Unit = '';

global RT_no;
RT_no=0;

global Rx_SA;
Rx_SA = 0;

global Tx_SA;
Tx_SA = 0;

global Record;
Record = [];

global Record_Matrix;
Record_Matrix = [];

global flag;
flag = 0;

global appendFlag;
appendFlag = 0;

global file_close;
file_close = 1;

% --- Outputs from this function are returned to the command line.
function varargout = lru_format_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function MSG_ID_text_Callback(hObject, eventdata, handles)

global MSG_ID;
user_entry = get(hObject,'string');
MSG_ID = user_entry;

% --- Executes during object creation, after setting all properties.
function MSG_ID_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function From_text_Callback(hObject, eventdata, handles)

global From;
user_entry = get(hObject,'string');
From = user_entry;

% --- Executes during object creation, after setting all properties.
function From_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function To_text_Callback(hObject, eventdata, handles)

global To;
user_entry = get(hObject,'string');
To = user_entry;


% --- Executes during object creation, after setting all properties.
function To_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Parameter_name_text_Callback(hObject, eventdata, handles)

global Parameter_name;
user_entry = get(hObject,'string');
Parameter_name = user_entry;

% --- Executes during object creation, after setting all properties.
function Parameter_name_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Start_word_text_Callback(hObject, eventdata, handles)

global Start_word;
user_entry = str2double(get(hObject,'string'));
Start_word = user_entry;


% --- Executes during object creation, after setting all properties.
function Start_word_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function End_word_text_Callback(hObject, eventdata, handles)

global End_word;
user_entry = str2double(get(hObject,'string'));
End_word = user_entry;

function End_word_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function signed_text_Callback(hObject, eventdata, handles)

global signed;
user_entry = str2double(get(hObject,'string'));
signed = user_entry;

function signed_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function RT_no_text_Callback(hObject, eventdata, handles)

global RT_no;
user_entry = str2double(get(hObject,'string'));
RT_no = user_entry;

function RT_no_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Tx_SA_text_Callback(hObject, eventdata, handles)

global Tx_SA;
user_entry = str2double(get(hObject,'string'));
Tx_SA = user_entry;
set(handles.Rx_SA_text,'Value',-1);

% --- Executes during object creation, after setting all properties.
function Tx_SA_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Rx_SA_text_Callback(hObject, eventdata, handles)

global Rx_SA;
user_entry = str2double(get(hObject,'string'));
Rx_SA = user_entry;


% --- Executes during object creation, after setting all properties.
function Rx_SA_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Unit_text_Callback(hObject, eventdata, handles)

global Unit;
user_entry = get(hObject,'string');
Unit = user_entry;

function Unit_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Start_bit_text_Callback(hObject, eventdata, handles)

global Start_bit;
user_entry = str2double(get(hObject,'string'));
Start_bit = user_entry;

function Start_bit_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function End_bit_text_Callback(hObject, eventdata, handles)

global End_bit;
user_entry = str2double(get(hObject,'string'));
End_bit = user_entry;

function End_bit_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function LSB_text_Callback(hObject, eventdata, handles)

global LSB;
user_entry = str2double(get(hObject,'string'));
LSB = user_entry;


% --- Executes during object creation, after setting all properties.
function LSB_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MSB_text_Callback(hObject, eventdata, handles)

global MSB;
user_entry = str2double(get(hObject,'string'));
MSB = user_entry;

function MSB_text_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function updateRecord()
global fileID;
global offset;

global MSG_ID;
global From;
global To;
global Parameter_name;
global Start_word;
global End_word;
global Start_bit;
global End_bit;
global LSB;
global MSB;
global Unit;
global RT_no;
global Rx_SA;
global Tx_SA;
global signed;

%disp(MSG_ID);
fseek(fileID,-offset,'cof');
fprintf(fileID,'%12s, %12s, %12s, %12s, %d, %d, %d, %d, %d, %12s, %d, %d, %6.8f, %6.8f, %d\n',...
    MSG_ID,From,To,Parameter_name,Start_word,End_word,...
    RT_no,Tx_SA,Rx_SA,Unit,Start_bit,End_bit,LSB,MSB,signed);
%fclose(fileID);
%fprintf(fileID,'%d, %12s\n','x','str');


% --- Executes on button press in pushbuttonSaveRecord.
function pushbuttonSaveRecord_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSaveRecord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fileID;
global access;
global fileName;
global MSG_ID;
global From;
global To;
global Parameter_name;
global Start_word;
global End_word;
global Start_bit;
global End_bit;
global LSB;
global MSB;
global Unit;
global RT_no;
global Rx_SA;
global Tx_SA;
global flag;
global signed;
global appendFlag;

if(appendFlag == 1)
    fprintf(fileID,'%12s, %12s, %12s, %12s, %d, %d, %d, %d, %d, %12s, %d, %d, %6.8f, %6.8f, %d\n',...
    MSG_ID,From,To,Parameter_name,Start_word,End_word,...
    RT_no,Tx_SA,Rx_SA,Unit,Start_bit,End_bit,LSB,MSB,signed);
    %appendFlag = 0;
    fclose(fileID);
    loadData(handles);
end

if(flag == 0 && appendFlag == 0)
    fid = fopen(fileName,'r');
    Text = textscan(fid,'%s','delimiter','\n');
    fclose(fid);

    Text = [Text{:}];
    u_MSG_ID = char(get(handles.MSG_ID_text,'String'));
    u_To_text = char(get(handles.To_text,'String'));
    u_From_text = char(get(handles.From_text,'String'));
    u_Parameter_name_text = char(get(handles.Parameter_name_text,'String'));
    u_End_bit_text = char(get(handles.End_bit_text,'String'));
    u_Start_bit_text = char(get(handles.Start_bit_text,'String'));
    u_Rx_SA_text = char(get(handles.Rx_SA_text,'String'));
    u_LSB_text = char(get(handles.LSB_text,'String'));
    u_RT_no_text = char(get(handles.RT_no_text,'String'));
    u_Unit_text = char(get(handles.Unit_text,'String'));
    u_MSB_text = char(get(handles.MSB_text,'String'));
    u_End_word_text = char(get(handles.End_word_text,'String'));
    u_Start_word_text = char(get(handles.Start_word_text,'String'));
    u_Tx_SA_text = char(get(handles.Tx_SA_text,'String'));
    u_signed_text = char(get(handles.signed_text,'String'));

    u  = [u_MSG_ID ',' u_From_text ',' u_To_text ',' u_Parameter_name_text ',' u_Start_word_text ',' u_End_word_text ',' u_RT_no_text ',' u_Tx_SA_text ',' u_Rx_SA_text ',' u_Unit_text ',' u_Start_bit_text ',' u_End_bit_text ',' u_LSB_text ',' u_MSB_text ',' u_signed_text];
    strArray = java.lang.String(u);
    Text(access+1) = cell(strArray); 
    fid = fopen(fileName,'w');
    fprintf(fid,'%s\n',Text{:});
    fclose(fid);
    loadData(handles);
end
if(flag == 1)
    fprintf(fileID,'%12s, %12s, %12s, %12s, %d, %d, %d, %d, %d, %12s, %d, %d, %6.8f, %6.8f, %d\n',...
    MSG_ID,From,To,Parameter_name,Start_word,End_word,...
    RT_no,Tx_SA,Rx_SA,Unit,Start_bit,End_bit,LSB,MSB,signed);
    clearFields(handles);
end
appendFlag = 0;



% --- Executes on button press in pushbuttonClose.
function pushbuttonClose_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonClose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fileID;
global fileName;
global flag;
global file_close;

if(flag == 0)
    fileID = fopen(fileName,'r');
    fclose(fileID);
else
    fclose(fileID);
end
file_close = 1;
clearFields(handles);

function createFile(handles)

global flag;
global fileID;
global file_close;

flag = 1;
user_entry = get(handles.fileName,'string');

if(isempty(user_entry))
    file_close = 1;
    msgbox('Specify File Name','error');
else
fname = [user_entry '.csv'];
fileID = fopen(fname,'w+');
fprintf(fileID,'%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s\n',...
    'MSG_ID','From','To','Parameter_name','Start_word','End_word',...
    'RT_no','Tx_SA','Rx_SA','Unit','Start_bit','End_bit','LSB','MSB','signed');
msgbox('File created');
end

function openFile(handles)

global flag;
global fileName;

flag = 0;
[fname, pname, findex] = uigetfile('*');
fileName = [pname,fname];

loadData(handles);

function loadData(handles)

global dSize;
global fileName;
global data;
data = fileloader(fileName);
temp = size(data);
dSize = temp(1)-1;

decodeData(handles);

function decodeData(handles)

global data;
global MSG_ID_array;
global From_array;
global To_array;
global Pname_array;
global SW_array;
global EW_array;
global RT_array;
global Tx_array;
global Rx_array;
global U_array;
global Sb_array;
global Eb_array;
global LSB_array;
global MSB_array;
global signed_array;
global access;

MSG_ID_array = data(:,1);
MSG_ID_array = MSG_ID_array(2:length(MSG_ID_array));

From_array = data(:,2);
From_array = From_array(2:length(From_array));

To_array = data(:,3);
To_array = To_array(2:length(To_array));

Pname_array = data(:,4);
Pname_array = Pname_array(2:length(Pname_array));

SW_array = str2double(data(:,5));
SW_array = SW_array(2:length(SW_array));

EW_array = str2double(data(:,6));
EW_array = EW_array(2:length(EW_array));

RT_array = str2double(data(:,7));
RT_array = RT_array(2:length(RT_array));

Tx_array = str2double(data(:,8));
Tx_array = Tx_array(2:length(Tx_array));

Rx_array = str2double(data(:,9));
Rx_array = Rx_array(2:length(Rx_array));

U_array = data(:,10);
U_array = U_array(2:length(U_array));

Sb_array = str2double(data(:,11));
Sb_array = Sb_array(2:length(Sb_array));

Eb_array = str2double(data(:,12));
Eb_array = Eb_array(2:length(Eb_array));

LSB_array = str2double(data(:,13));
LSB_array = LSB_array(2:length(LSB_array));

MSB_array = str2double(data(:,14));
MSB_array = MSB_array(2:length(MSB_array));

signed_array = str2double(data(:,15));
signed_array = signed_array(2:length(signed_array));

displayVal(access,handles);

function displayVal(i,handles)

global MSG_ID_array;
global From_array;
global To_array;
global Pname_array;
global SW_array;
global EW_array;
global RT_array;
global Tx_array;
global Rx_array;
global U_array;
global Sb_array;
global Eb_array;
global LSB_array;
global MSB_array;
global signed_array;

set(handles.MSG_ID_text,'String',MSG_ID_array(i));
set(handles.MSG_ID_text,'enable','off');

set(handles.From_text,'String',From_array(i));
set(handles.From_text,'enable','off');

set(handles.To_text,'String',To_array(i));
set(handles.To_text,'enable','off');

set(handles.Parameter_name_text,'String',Pname_array(i));
set(handles.Parameter_name_text,'enable','off');

set(handles.Start_word_text,'String',SW_array(i));
set(handles.Start_word_text,'enable','off');

set(handles.End_word_text,'String',EW_array(i));
set(handles.End_word_text,'enable','off');

set(handles.RT_no_text,'String',RT_array(i));
set(handles.RT_no_text,'enable','off');

set(handles.Tx_SA_text,'String',Tx_array(i));
set(handles.Tx_SA_text,'enable','off');

set(handles.Rx_SA_text,'String',Rx_array(i));
set(handles.Rx_SA_text,'enable','off');

set(handles.Unit_text,'String',U_array(i));
set(handles.Unit_text,'enable','off');

set(handles.Start_bit_text,'String',Sb_array(i));
set(handles.Start_bit_text,'enable','off');

set(handles.End_bit_text,'String',Eb_array(i));
set(handles.End_bit_text,'enable','off');

set(handles.LSB_text,'String',LSB_array(i));
set(handles.LSB_text,'enable','off');

set(handles.MSB_text,'String',MSB_array(i));
set(handles.MSB_text,'enable','off');

set(handles.signed_text,'String',signed_array(i));
set(handles.signed_text,'enable','off');
toggleView(handles);


function nextRecord(handles)

global access;
global dSize;

if(access > dSize)
    access = dSize;
    msgbox('End of File');
else 
    displayVal(access,handles);
end
    
function prevRecord(handles)

global access;

if(access < 1)
    access = 1;
    displayVal(access,handles);
    msgbox('Beginning of File');
else 
    displayVal(access,handles);
end

% --- Executes on button press in pushbuttonNext.
function pushbuttonNext_Callback(hObject, eventdata, handles)
global fileName;
global access;

if( strcmp(fileName,''))
    msgbox('File not open for viewing','warning','warn');
else

access = access+1;
nextRecord(handles);
end

% --- Executes on button press in pushbuttonPrevious.
function pushbuttonPrevious_Callback(hObject, eventdata, handles)
global fileName;
global access;

if( strcmp(fileName,''))
    msgbox('File not open for viewing','warning','warn');
else

access = access-1;
prevRecord(handles);
end

% --- Executes on button press in pushbuttonCreate.
function pushbuttonCreate_Callback(hObject, eventdata, handles)
global file_close;

if( file_close )
    file_close = 0;
    createFile(handles);
else
    msgbox('Please close the file','error');
end
    
% --- Executes on button press in pushbuttonOpen.
function pushbuttonOpen_Callback(hObject, eventdata, handles)
global file_close;

if( file_close )
    set(handles.radiobuttonView,'Value',1);
    set(handles.radiobuttonEdit,'Value',0);
    file_close = 0;
    openFile(handles);
else
    msgbox('Please close the file','error');
end


% --- Executes on button press in radiobuttonView.
function radiobuttonView_Callback(hObject, eventdata, handles)

if(get(hObject,'Value'))
    set(handles.radiobuttonEdit,'Value',0);
    toggleView(handles);
else
    set(handles.radiobuttonEdit,'Value',1);
end

% --- Executes on button press in radiobuttonEdit.
function radiobuttonEdit_Callback(hObject, eventdata, handles)

if(get(hObject,'Value'))
    set(handles.radiobuttonView,'Value',0);
    toggleEdit(handles);
else
    set(handles.radiobuttonView,'Value',1);
end

function fileName_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% to clear text fieds
function clearFields(handles)

set(handles.MSG_ID_text,'String','');
set(handles.From_text,'String','');
set(handles.To_text,'String','');
set(handles.Parameter_name_text,'String','');
set(handles.Start_word_text,'String','');
set(handles.End_word_text,'String','');
set(handles.RT_no_text,'String','');
set(handles.Tx_SA_text,'String','');
set(handles.Rx_SA_text,'String','');
set(handles.Unit_text,'String','');
set(handles.Start_bit_text,'String','');
set(handles.End_bit_text,'String','');
set(handles.LSB_text,'String','');
set(handles.MSB_text,'String','');
set(handles.signed_text,'String','');


% --- Executes during object creation, after setting all properties.
function End_word_CreateFcn(hObject, eventdata, handles)
% hObject    handle to End_word (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbuttonAdd.
function pushbuttonAdd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fileID;
global appendFlag;
global fileName;
global access;
global dSize;

clearFields(handles);
toggleEdit(handles);
fileID = fopen(fileName,'a');
fseek(fileID,0,'eof');
appendFlag = 1;
access = dSize+1;

function toggleView(handles)

set(handles.radiobuttonView,'Value',1);
set(handles.radiobuttonEdit,'Value',0);
set(handles.MSG_ID_text,'enable','off');
set(handles.From_text,'enable','off');
set(handles.To_text,'enable','off');
set(handles.Parameter_name_text,'enable','off');
set(handles.Start_word_text,'enable','off');
set(handles.End_word_text,'enable','off');
set(handles.RT_no_text,'enable','off');
set(handles.Tx_SA_text,'enable','off');
set(handles.Rx_SA_text,'enable','off');
set(handles.Unit_text,'enable','off');
set(handles.Start_bit_text,'enable','off');
set(handles.End_bit_text,'enable','off');
set(handles.LSB_text,'enable','off');
set(handles.MSB_text,'enable','off');
set(handles.signed_text,'enable','off');

function toggleEdit(handles)

set(handles.radiobuttonView,'Value',0);
set(handles.radiobuttonEdit,'Value',1);
set(handles.MSG_ID_text,'enable','on');
set(handles.From_text,'enable','on');
set(handles.To_text,'enable','on');
set(handles.Parameter_name_text,'enable','on');
set(handles.Start_word_text,'enable','on');
set(handles.End_word_text,'enable','on');
set(handles.RT_no_text,'enable','on');
set(handles.Tx_SA_text,'enable','on');
set(handles.Rx_SA_text,'enable','on');
set(handles.Unit_text,'enable','on');
set(handles.Start_bit_text,'enable','on');
set(handles.End_bit_text,'enable','on');
set(handles.LSB_text,'enable','on');
set(handles.MSB_text,'enable','on');
set(handles.signed_text,'enable','on');

function [x,h] = fileloader(file,varargin)
% Open file
fid = fopen(file);

% Get headers
headers = fgetl(fid);
headers = textscan(headers,'%s','Delimiter',',');
h = headers{1};
numH = length(h);

%Determine textscan format string from header information
sFormat = [];
for i = 1:length(h)
    sFormat = [sFormat '%s']; %#ok
end

if nargin > 1    % Import partial file based on input parameters
  
  % Validate name/value pairs
  parsenv(fid,varargin{:});

  % Move file pointer if start record specified
  bStartRecord = strcmpi('start',varargin);

  if any(bStartRecord)
   
    % Increment to be used in scanning file
    rinc = 100000;
    
    % Start record value to move file pointer to
    srecord = varargin{find(bStartRecord)+1};
    
    % Move file pointer in 100000 records increments
    records = 1:rinc:srecord-1;
    for i = 2:length(records)
      textscan(fid,sFormat,rinc,'delimiter',',');
    end

    % Move file pointer rest of way to desired start record
    lorecord = mod(srecord-1,rinc);
    textscan(fid,sFormat,lorecord,'delimiter',',');
    
  end
  
  % Scan only specified number of records if given
  bNumRecords = strcmpi('records',varargin);
  
  if any(bNumRecords)
    
    % Scan records up to specified number of records
    numrecords = varargin{find(bNumRecords)+1};
    thData = textscan(fid,sFormat,numrecords,'delimiter',',');
   
  else
    
    % Scan rest of file from starting point
    thData = textscan(fid,sFormat,'delimiter',',');
    
  end

else
  
  % Read the entire data file
  thData = textscan(fid,sFormat,'delimiter',',');
  
end

% Parse data into cell array with headers
numRows = size(thData{1},1)+1;
x = cell(numRows,numH);
x(1,:) = h;
for i = 1:numH
  switch class(thData{i}(1))
    case 'double'
      x(2:end,i) = num2cell(thData{i});
    otherwise
      x(2:end,i) = thData{i};
  end
end

% Close file
fclose(fid);

% Return records for only specified securities and dates if given
if nargin > 1
  
  for i = 1:2:length(varargin)

    switch varargin{i}
      
      case 'security'
        
        % Create logical map of included records
        numRows = size(x(:,1),1);
        secMap = false(numRows,1);
        
        %Convert security input to cell array
        if ischar(varargin{i+1})
          varargin{i+1} = cellstr(varargin{i+1});
        end
        
        % Loop through given securities
        for j = 1:length(varargin{i+1})
          
          % Find matching records and apply to secMap
          secMap = secMap | strcmp(varargin{i+1}(j),x(:,1));
          
        end
        
        % Column header is always included
        secMap(1) = true;
        
        x(~secMap,:) = [];
        
      case 'date'
        
        %   % Month list
        sMnths = {'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'};
        sNums = {'01','02','03','04','05','06','07','08','09','10','11','12'};
        
        switch length(varargin{i+1})
          
          case 1
            
            dtNum1 = datestr(varargin{i+1}(1));
            mnNum1 = sNums{strcmpi(dtNum1(4:6),sMnths)};
            if length(dtNum1) == 11
              dtNum1 = [dtNum1 ' 00:00:00'];   %#ok
            end
            dtNum1 = sscanf([dtNum1(8:11)  mnNum1 dtNum1(1:2) ...
                                 dtNum1(13:14) dtNum1(16:17) dtNum1(19:20)],'%f');
            dtNum2 = datestr(datenum(varargin{i+1}(1))+1);
            mnNum2 = sNums{strcmpi(dtNum2(4:6),sMnths)};
            if length(dtNum2) == 11
              dtNum2 = [dtNum2 ' 00:00:00'];   %#ok
            end
            dtNum2 = sscanf([dtNum2(8:11)  mnNum2 dtNum2(1:2) ...
                                 dtNum2(13:14) dtNum2(16:17) dtNum2(19:20)],'%f');
            
          case 2
            
            dtNum1 = datestr(varargin{i+1}(1));
            mnNum1 = sNums{strcmpi(dtNum1(4:6),sMnths)};
            if length(dtNum1) == 11
              dtNum1 = [dtNum1 ' 00:00:00'];   %#ok
            end
            dtNum1 = sscanf([dtNum1(8:11)  mnNum1 dtNum1(1:2) ...
                                 dtNum1(13:14) dtNum1(16:17) dtNum1(19:20)],'%f');
          
            dtNum2 = datestr(varargin{i+1}(2));
            mnNum2 = sNums{strcmpi(dtNum2(4:6),sMnths)};
            if length(dtNum2) == 11
              dtNum2 = [dtNum2 ' 00:00:00'];   %#ok
            end
            dtNum2 = sscanf([dtNum2(8:11) mnNum2 dtNum2(1:2) ...
                                 dtNum2(13:14) dtNum2(16:17) dtNum2(19:20)],'%f');
          
            
        end 

        % Get dates and times
        sDates = char(x(:,2));
        sTimes = char(x(:,3));
        
        % Convert date and time stamps to numeric date numbers of form
        % YYYYMMDDHHMMSS
        numStamps = size(sDates,1);
        dtNum = ones(numStamps-1,1);
        for j = 1:numStamps-1
          nMnth = sNums{strcmp(sDates(j+1,4:6),sMnths)};
          dtNum(j,1) = sscanf([sDates(j+1,8:11) nMnth sDates(j+1,1:2) ...
                        sTimes(j+1,1:2) sTimes(j+1,4:5) sTimes(j+1,7:8)],'%f');
        end
        
        % Create date match map and remove records outside of range
        % Set first element of map to true to preserver header row
        datMap = [true;(dtNum >= dtNum1) & (dtNum <= dtNum2)];
        x(~datMap,:) = [];
        
    end
    
  end

end


function parsenv(fid,varargin)
%PARSENV(FID,VARARGIN) parses name/value pairs for Reuters® Datascope Tick History.

% Default parameter names
pNames = {'date','records','security','start'};
                              
% Initialize some variables.
nInputs = length(varargin);  % # of input arguments

% Ensure parameter/value pairs.
if mod(nInputs, 2) ~= 0
  
  fclose(fid);
  error(message('datafeed:rdth:parsepvpairs:incorrectNumberOfInputs'));

else

  % Process p/v pairs.
  for j = 1:2:nInputs
    
    pName = varargin{j};

    if ~ischar(pName)
      fclose(fid);
      error(message('datafeed:rdth:parsenv:nonTextString'));  
    end

    i = find(strncmp(pName, pNames, length(pName)));

    if isempty(i)
      fclose(fid);
      error(message('datafeed:rdth:parsenv:invalidParameter', pName));

    elseif length(i) > 1
      
      % If ambiguities exist, check for exact match to narrow search.
      i = find(strcmp(pName, pNames));
      if ~(length(i) == 1)
        fclose(fid);
        error(message('datafeed:rdth:parsenv:ambiguousParameter', pName));
      end
      
    end

  end
  
end