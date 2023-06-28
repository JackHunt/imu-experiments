clear;
clc;

SERIAL_PORT = ['/dev/tty.usbserial-A4009U6P'];
BAUD_RATE = 115200;

s = serial(SERIAL_PORT, 'BaudRate', BAUD_RATE);
fopen(s);

figure;
hold on;

num_points = 250;
accelData = zeros(num_points, 3);
gyroData = zeros(num_points, 3);

while ishandle(gcf)
    data = fscanf(s);
    vals = str2double(strsplit(data, ' '));
    
    if length(vals) == 6
        accelData = [accelData(2:end, :); vals(1:3)];
        gyroData = [gyroData(2:end, :); vals(4:6)];
        
        subplot(2, 1, 1);
        plot(accelData);
        title('Accelerometer Data');
        legend('X', 'Y', 'Z');
        
        subplot(2, 1, 2);
        plot(gyroData);
        title('Gyro Data');
        legend('X', 'Y', 'Z');
        
        drawnow;
    end
end

fclose(s);
delete(s);
clear s;
