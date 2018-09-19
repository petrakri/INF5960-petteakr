function varargout = skiFlexGui(varargin)
% skiflexgui MATLAB code for skiFlexGui.fig
%      skiflexgui, by itself, creates a new skiflexgui or raises the existing
%      singleton*.
%
%      H = skiflexgui returns the handle to a new skiflexgui or the handle to
%      the existing singleton*.
%
%      skiflexgui('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in skiflexgui.M with the given input arguments.
%
%      skiflexgui('Property','Value',...) creates a new skiflexgui or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before skiFlexGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to skiFlexGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help skiFlexGui

% Last Modified by GUIDE v2.5 03-Dec-2013 21:33:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @skiFlexGui_OpeningFcn, ...
                   'gui_OutputFcn',  @skiFlexGui_OutputFcn, ...
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
end


% --- Executes just before skiFlexGui is made visible.
function skiFlexGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to skiFlexGui (see VARARGIN)

% Choose default command line output for skiFlexGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes skiFlexGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%Create a global value to hold a struct of data we need in the GUi
global data
data.filename = 'Filename';     %Name on file to save
data.sensor_nbr = 0;            %Number of sensor to measure calibration
data.start = 0;                 %If start = 1 we plot if 0 we dont
data.buffer = zeros(1,16);      %Buffer of values to plot
data.buffer_force = zeros(1,16);%Buffer of values to plot

%Load the calibrated values
load calibratedValues.mat
data.a = aF;
data.b = bF;

%Set plot preferences
title(handles.plot_window, 'Sensor array');
xlabel(handles.plot_window, 'Sensor');
ylabel(handles.plot_window, 'Volt');
axis(handles.plot_window, [-1  16 0 5]);

title(handles.plot_window_force, 'Sensor array');
xlabel(handles.plot_window_force, 'Sensor');
ylabel(handles.plot_window_force, 'Force');
axis(handles.plot_window_force, [-1  16 0 450]);

%Connect to arduino
global a;
a = arduino('/dev/ttyACM0');

%Redefine the close function to my own
set(gcf,'CloseRequestFcn',@my_closefcn)
end

%Main function. This is the function that's plotting
function main(handles)
global data;
keep_running = true;
R2 = 1e6;
Vin = 5;
while keep_running
    %Get data from GUI
    %Check if stop is pressed
    if data.start == 0;
        keep_running = false;
    end
    %Read from mux
    [mux0array mux1array mux2array] = readMux();
    data.buffer = [mux0array.*(5.0/1023.0)];%...
        %mux1array.*(5.0/1023.0) mux2array.*(5.0/1023.0)];
    
    indx_zero = data.buffer < 0.5; %Find index of low volt values
    indx_peak = data.buffer == 5;
    
    data.buffer_force = (((1./(R2*Vin./data.buffer - R2))-data.b)./data.a)*9.81;
    data.buffer_force(indx_zero) = 0; %Set these values to zero
    data.buffer_force(indx_peak) = 450;
    
    %Plot the updated buffer
    stem(handles.plot_window, [0:1:15], data.buffer);
    stem(handles.plot_window_force, [0:1:15], data.buffer_force);
    axis(handles.plot_window, [-1  16 0 5]);
    axis(handles.plot_window_force, [-1  16 -500 500]);

    %Set plot preferences
    title(handles.plot_window, 'Sensor array');
    xlabel(handles.plot_window, 'Sensor');
    ylabel(handles.plot_window, 'Volt');
    title(handles.plot_window, 'Sensor array');
    xlabel(handles.plot_window, 'Sensor');
    ylabel(handles.plot_window, 'Force (N)');
    drawnow
end


end

% --- Outputs from this function are returned to the command line.
function varargout = skiFlexGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in btn_start.
function btn_start_Callback(hObject, eventdata, handles)
% hObject    handle to btn_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Start pressed!')
global data;
data.start = 1; %Set start to 1 to start plotting
main(handles)   %Start main function
end


% --- Executes on button press in btn_stop.
function btn_stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
disp('Stop pressed!')
data.start = 0; %Stop the plotting loop
end

%My close function. This function overrides the standard closing function
function my_closefcn(src,event)
    %Close the arduino session
    disp('Close Arduino session');
    global a;
    delete(a);
    disp('Closing GUI');
    delete(gcf);
end

%Function to read the values from the multiplexer.
function [mux0array mux1array mux2array] = readMux()
global a
%Define control pins
S0 = 2;
S1 = 4;
S2 = 6;
S3 = 7;

%Initiate variables
mux0array = ones(1,16);
mux1array = ones(1,16);
mux2array = ones(1,16);

%Setup pins
a.pinMode(S0,'OUTPUT');
a.pinMode(S1,'OUTPUT');
a.pinMode(S2,'OUTPUT');
a.pinMode(S3,'OUTPUT');

for i = 1:length(mux0array)
    j = i-1;
    a.digitalWrite(S0, bitand(j,1));
    a.digitalWrite(S1, bitshift(bitand(j,3),-1));
    a.digitalWrite(S2, bitshift(bitand(j,7),-2));
    a.digitalWrite(S3, bitshift(bitand(j,15),-3));
    
    mux0array(i) = a.analogRead(0);
    mux1array(i) = a.analogRead(1);
    mux2array(i) = a.analogRead(2);
end
end


function txt_filename_Callback(hObject, eventdata, handles)
% hObject    handle to txt_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_filename as text
%        str2double(get(hObject,'String')) returns contents of txt_filename as a double
global data;
data.filename = get(hObject,'String');  %Get the filename
end
% --- Executes during object creation, after setting all properties.
function txt_filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on selection change in nbr_sensor.
function nbr_sensor_Callback(hObject, eventdata, handles)
% hObject    handle to nbr_sensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns nbr_sensor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from nbr_sensor
end

% --- Executes during object creation, after setting all properties.
function nbr_sensor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nbr_sensor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in btn_measure.
%Measures the value of the sensor selected
function btn_measure_Callback(hObject, eventdata, handles)
% hObject    handle to btn_measure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
[mux0array mux1array mux2array] = readMux();
value = zeros(1,10);
for i = 1:10
    value(i) = mux0array(data.sensor_nbr+1) * (5.0 / 1023.0);
end
R2 = 1.0e6;
Vin = 5.0;
force = (((1./(R2*Vin./value - R2))-data.b)./data.a)*9.81;

set(handles.str_value_volt,'String',[num2str(mean(value)) 'V']);
set(handles.str_value_force,'String',[num2str(mean(force)) 'N']);
end


% --- Executes on slider movement.
%Read value from slider
function sensor_slider_Callback(hObject, eventdata, handles)
% hObject    handle to sensor_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global data;
data.sensor_nbr = round(get(hObject,'Value'));
set(handles.text_sensor_value,'String',['Value sensor ',num2str(data.sensor_nbr),':']);
end

% --- Executes during object creation, after setting all properties.
function sensor_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sensor_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end


% --- Executes on button press in btn_save.
%Save the values in buffer to file
function btn_save_Callback(hObject, eventdata, handles)
% hObject    handle to btn_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global data;
values = data.buffer;
values_force = data.buffer_force;
save(strcat('SavedValues/',data.filename),'values','values_force') %Save the file
fprintf('Saved values to file %s!\n',data.filename);
end
