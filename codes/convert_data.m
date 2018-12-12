function varargout = convert_data(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @convert_data_OpeningFcn, ...
                   'gui_OutputFcn',  @convert_data_OutputFcn, ...
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


% --- Executes just before convert_data is made visible.
function convert_data_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
global raw_file;
global db_file;

raw_file = '';
db_file = '';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes convert_data wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = convert_data_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbuttonLoadRaw.
function pushbuttonLoadRaw_Callback(hObject, eventdata, handles)

global rawData;
global raw_file;

[fname, pname, findex] = uigetfile('*');
fpath = [pname,fname];
raw_file = fpath;
set(handles.displayRaw,'String',fname);
set(handles.displayRaw,'enable','off');
rawData = fileloader(fpath);
msgbox('loaded success');
msg_id = rawData(:,4);
msg_id = msg_id(2:length(msg_id));
msg_id = unique(msg_id);
set(handles.popupmenu1,'string',msg_id);


% --- Executes on button press in pushbuttonDB.
function pushbuttonDB_Callback(hObject, eventdata, handles)

global dbData;
global db_file;

[fname, pname, findex] = uigetfile('*');
fpath = [pname,fname];
db_file = fpath;
set(handles.displayDB,'String',fname);
set(handles.displayDB,'enable','off');
dbData = fileloader(fpath);
msgbox('loaded success');

function displayRaw_Callback(hObject, eventdata, handles)
% hObject    handle to displayRaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of displayRaw as text
%        str2double(get(hObject,'String')) returns contents of displayRaw as a double


% --- Executes during object creation, after setting all properties.
function displayRaw_CreateFcn(hObject, eventdata, handles)
% hObject    handle to displayRaw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function displayDB_Callback(hObject, eventdata, handles)
% hObject    handle to displayDB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of displayDB as text
%        str2double(get(hObject,'String')) returns contents of displayDB as a double


% --- Executes during object creation, after setting all properties.
function displayDB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to displayDB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonConvert.
function pushbuttonConvert_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonConvert (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global rawData;
global msg_id;
global raw_file;
global db_file;
%strcmp(rawData,'')
%strcmp(dbData,'')
if( strcmp(raw_file,'') || strcmp(db_file,'') )
    msgbox('File not loaded','error','error');
else
 index_selected = get(handles.popupmenu1,'Value');
 id_list = get(handles.popupmenu1,'String');
 msg_id = id_list{index_selected};
 
i = abs(str2double(msg_id(length(msg_id)-1:length(msg_id))));
if(i == 0)
    i = 32;
end

index = 8+i-1;
msg_id_array = rawData(:,4);

%to fetch all 32 words
w_32 = [ rawData(:,[8:index]) ];

%to find required indices
w_find = find(strcmp(msg_id,msg_id_array));

% filtered words from the message ID's
w_req = w_32(w_find,:);
DB_filter(msg_id,w_req);
end

function DB_filter(inp,w_req) 
%input to this function - 'msg_ID',w_req
global msg_id;
global dbData;
% The below computations must be GLOBAL

% pick out essential columns from database created
 
msg_ID = dbData(:,1);
params = dbData(:,4);
sw = str2double(dbData(:,5));
ew = str2double(dbData(:,6));
rt_no = str2double(dbData(:,7));
tx_sa = str2double(dbData(:,8));
rx_sa = str2double(dbData(:,9));
sb = str2double(dbData(:,11));
eb = str2double(dbData(:,12));
lsb = str2double(dbData(:,13));
signed = str2double(dbData(:,15));


% pick out essential columns from database
%{
msg_ID = dbData(:,1);
params = dbData(:,7);
sw = str2double(dbData(:,9));
ew = str2double(dbData(:,10));
sb = str2double(dbData(:,11));
eb = str2double(dbData(:,12));
lsb = str2double(dbData(:,13));
signed = str2double(dbData(:,17));
%}

%eliminating first row
msg_ID = msg_ID(2:length(msg_ID));
params = params(2:length(params));
sw = sw(2:length(sw));
ew = ew(2:length(ew));
rt_no = rt_no(2:length(rt_no));
tx_sa = tx_sa(2:length(tx_sa));
rx_sa = rx_sa(2:length(rx_sa));
sb = sb(2:length(sb));
eb = eb(2:length(eb));
lsb = lsb(2:length(lsb));
signed = signed(2:length(signed));

%filter the msg_IDs from created databse
%f_index = find(strcmp(inp,msg_ID));

%filter through regexp

msg_content = regexp(inp,'\d*','Match');
if( strcmp(msg_content(2),'0') )
    temp = rx_sa;
else 
    temp = tx_sa;
end


f_index = find( strcmp(msg_content(1),num2str(rt_no)) & strcmp(msg_content(3),num2str(temp)) );


p_col = params(f_index);
%run a loop for f_index
result = [];
p_array = [];

for i = 1:length(f_index)
    pname = params(f_index(i));
    s_w = sw(f_index(i));
    e_w = ew(f_index(i));
    s_b = sb(f_index(i));
    e_b = eb(f_index(i));
    sig = signed(f_index(i));
    % check for start word and end word
    if(s_w == e_w)
        f_w = s_w;
    else 
        f_w = s_w : e_w;
    end
    if(length(f_w) == 1)
        word = fetchWord(w_req, f_w);
    else
        word = extended_word(w_req,f_w);
    end
    nbits = length(f_w)*16;
    values = convert_to_eng(word,s_b,e_b,sig,nbits);
    values = values.*lsb(f_index(i));
    result = horzcat(result,values);
    p_array = horzcat(p_array,pname);
end



result = result.';
fname = [ msg_id '.csv' ];
fid = fopen(fname,'w+');
fprintf(fid,'%s,',p_col{:});
fprintf(fid,'\n');
fclose(fid);

fid = fopen(fname,'a');
f_spec = format_spec(length(f_index));
fprintf(fid,f_spec,result);
fclose(fid);
fclose('all');
msgbox('File created');
%csvwrite('myTest.csv',m);

function result = format_spec(f_index)

str = '%6.8f,';
result = '';
for i = 1:f_index
    if(i < f_index)
        result = strcat(result,str);
    else
        result = strcat(result,'%6.8f\n');
    end
end

function word = fetchWord(w_req,f_w)

word = w_req(:,f_w);
%word = cell2mat(word)

function word = extended_word(w_req,f_w)

word = [];
bin = [];

for i = f_w
        word = fetchWord(w_req, i);
        h = hex2dec(word);
        d = dec2bin(h,16);
        bin = horzcat(bin,d);
end
word = bin2dec(bin);
word = dec2hex(word);

function values = convert_to_eng(inp,sb,eb,sig,nbits)

%sb = sb-1;
%eb = eb-1;
nbits = nbits-1;
dec = hex2dec(inp);

div = 2^(nbits-eb);
shifted = floor(dec/div);
mdVal = 2^(eb-sb+1);
values = mod(shifted, mdVal);
if(sig == 1)
    values = signed_bit(values,eb-sb+1);
end

function fVal = signed_bit(val,nbit)

less_than = val < 2^(nbit-1);
val(less_than == 1) = val(less_than);

if(val < 2^(nbit-1))
    fVal = val;
else
    val(less_than == 0) = -mod(val(less_than == 0),2^(nbit-1));
    if(val(less_than == 0) == 0)
        val(less_than == 0) = val(less_than == 0);
    end
end
fVal = val;

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