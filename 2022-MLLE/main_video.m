clc
clear 
close all
addpath('Method');
filename ='/home/hzc/CodeRepository/UnderwaterEnhancement/TraditionalMethod/Non-physicalModel/MMLE_code/2022-MLLE/Video/3.mp4';
if ~exist(filename, 'file')
    error('文件不存在：%s', filename);
end
obj = VideoReader(filename);
WriterObj=VideoWriter('Video/3Resultmp4');
open(WriterObj);

numFrames = obj.NumFrames;
for i = 1 : 1: numFrames
    frame = read(obj,i);
    %% 增强视频
    frame1 = (LACE(LACC(frame)));
    frame2 (:,:,1) = [frame(:,:,1),frame1(:,:,1)];
    frame2 (:,:,2) = [frame(:,:,2),frame1(:,:,2)];
    frame2 (:,:,3) = [frame(:,:,3),frame1(:,:,3)];
    writeVideo(WriterObj,frame2);
    imshow(frame2);
end
close(WriterObj);

