function varargout = sensorGui(varargin)
% SENSORGUI MATLAB code for sensorGui.fig
%      SENSORGUI, by itself, creates a new SENSORGUI or raises the existing
%      singleton*.
%
%      H = SENSORGUI returns the handle to a new SENSORGUI or the handle to
%      the existing singleton*.
%
%      SENSORGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SENSORGUI.M with the given input arguments.
%
%      SENSORGUI('Property','Value',...) creates a new SENSORGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sensorGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sensorGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sensorGui

% Last Modified by GUIDE v2.5 03-Dec-2013 14:26:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sensorGui_OpeningFcn, ...
                   'gui_OutputFcn',  @sensorGui_OutputFcn, ...
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


% --- Executes just before sensorGui is made visible.
function sensorGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sensorGui (see VARARGIN)

% Choose default command line output for sensorGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sensorGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);'

load calibratedValues;

%Data is now saved as a global variable
global data;
data.aF = aF;
data.bF = bF;
%Set start plotting value to zero;
data.start = 0;
data.sensors = 2;
%Creating plot buffer;
data.buffer1 = zeros(1,500);
data.buffer2 = zeros(1,500);

%Set plot preferences
title(handles.plot_window, 'Sensor reading');
xlabel(handles.plot_window, 'Sample');
ylabel(handles.plot_window, 'Volt');

%Connect to arduino
global a;
a = arduino('/dev/ttyACM0');

%Redefine the close function to my own
set(gcf,'CloseRequestFcn',@my_closefcn)
end

function main(handles)
global a;
global data;
keep_running = true;
R2 = 1e6;
Vin = 5;
while keep_running
    %Check if stop is pressed
    if data.start == 0;
        keep_running = false;
    end
    
    [valueVoltSensor1,valueForceSensor1] = convertMeasuredValue(a.analogRead(2));
    %Read value from Arduino pin analog 0 and convert to volt
    %valueVolt = a.analogRead(2) * (5.0 / 1023.0);
    %valueRSensor1 = R2*Vin/valueVolt - R2;
    %Shift buffer and insert the new value read
    data.buffer1 = [data.buffer1(2:end) valueVoltSensor1];
    %Plot the updated buffer
    hold(handles.plot_window,'off')
    plot(handles.plot_window,data.buffer1);
    hold(handles.plot_window,'on')

    %data.aF
    %data.bF
    
    %((1./R_1(1)-bF)/aF)*0.00981
    
    if data.sensors == 2
        [valueVoltSensor2,valueForceSensor2] = convertMeasuredValue(a.analogRead(3));
        %valueVolt2 = a.analogRead(3) * (5.0 / 1023.0);
        %valueRSensor2 = R2*Vin/valueVolt2 - R2;
        data.buffer2 = [data.buffer2(2:end) valueVoltSensor2];%((1/valueRSensor2-data.bF)/data.aF)*0.00981];
        plot(handles.plot_window,data.buffer2,'r');
        axis(handles.plot_window, [0 500 0 5]);
    end

    %Set plot preferences
    title(handles.plot_window, 'Sensor reading');
    xlabel(handles.plot_window, 'Sample');
    ylabel(handles.plot_window, 'Volt');
    legend(handles.plot_window, 'Sensor 1', 'Sensor 2');
    drawnow
end
end

function [valueVolt,valueForce] = convertMeasuredValue(analogValue)
    global data;
    Vin = 5.0;
    R2 = 1.0e6;
    valueVolt = analogValue .* (5.0 / 1023.0);
    valueRSensor = R2*Vin./valueVolt - R2;
    if valueVolt < 0.1
        valueForce = 0;
    else
        valueForce = ((1./valueRSensor-data.bF)./data.aF).*0.00981;
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = sensorGui_OutputFcn(hObject, eventdata, handles) 
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
global a;
global data;
data.start = 1;
main(handles)
end

% --- Executes on button press in btn_stop.
function btn_stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disp('Stop pressed!')
global data;
%Stop the plotting loop
data.start = 0;
end

function my_closefcn(src,event)

    %Close the arduino session
    disp('Close Arduino session');
    global a;
    delete(a);
    disp('Closing GUI');
    delete(gcf);
end


%TODO
% 1 : Make buttons not visible when they should not be able to be pressed
% 2 : Be able to record data
% 3 : Convert "V" to Neuton or pascal


% --- Executes on button press in btn_measure.
function btn_measure_Callback(hObject, eventdata, handles)
% hObject    handle to btn_measure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
value = zeros(1,4);
value2 = zeros(1,4);
for i=1:10
    value(i) = a.analogRead(2);
    value2(i) = a.analogRead(3);
end

[valueVoltSensor1,valueForceSensor1] = convertMeasuredValue(value);
[valueVoltSensor2,valueForceSensor2] = convertMeasuredValue(value2);

set(handles.value_sensor1_volt_text,'String',strcat(num2str(mean(valueVoltSensor1)),' V'));
set(handles.value_sensor1_force_text,'String',strcat(num2str(mean(valueForceSensor1)),' N'));
set(handles.value_sensor2_volt_text,'String',strcat(num2str(mean(valueVoltSensor2)),' V'));
set(handles.value_sensor2_force_text,'String',strcat(num2str(mean(valueForceSensor2)),' N'));
end

% --- Executes on button press in radio_btn_log.
function radio_btn_log_Callback(hObject, eventdata, handles)
% hObject    handle to radio_btn_log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_btn_log
end


function filename_Callback(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filename as text
%        str2double(get(hObject,'String')) returns contents of filename as a double
end

% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filename (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
