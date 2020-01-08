%% ר�����ڵ��� MTI201506 ������
function [Accelerometer  Gyroscope Magnetometer EularAngle time] = wyx_data_import(path )

fidin=fopen(path);     
fidout=fopen('mkmatlab.txt','w');                       % ����MKMATLAB.txt�ļ� 
while ~feof(fidin)                                      % �ж��Ƿ�Ϊ�ļ�ĩβ               
    tline=fgetl(fidin);                                 % ���ļ�����   
    if double(tline(1))>=48&&double(tline(1))<=57       % �ж����ַ��Ƿ�����ֵ 
       fprintf(fidout,'%s\n\n',tline);                  % ����������У��Ѵ�������д���ļ�MKMATLAB.txt 
       continue                                         % ����Ƿ����ּ�����һ��ѭ�� 
    end 
end 
fclose(fidout); 
MK=importdata('MKMATLAB.txt');      % �����ɵ�MKMATLAB.txt�ļ����빤���ռ䣬������ΪMK��ʵ����������ʾ���� 

Accelerometer = MK(:,3:5);
Gyroscope = MK(:,6:8);
Magnetometer = MK(:,9:11);
EularAngle = MK(:,15:17);
time = 1:length(Accelerometer);
time = time / 100;

end