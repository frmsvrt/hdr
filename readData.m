function [images, exposureTimes] = readData(folder)
% function readData
% input folder dir
% read images from the folder and their exposure time

if folder(end) ~= '/'
    folder = [folder '/'];
end

files = dir([folder, '*.tif']); % TODO: update file format to be robust

info = imfinfo([files(1,1).folder '/' files(1,1).name]);
number = length(files);
images = zeros(info.Height, info.Width, 3, number);
exposureTimes = zeros(number, 1);

for i=1:number
    fname = [folder, '/', files(i, 1).name];
    inf = imfinfo(fname);
    dc = inf.DigitalCamera;
    img = imread(fname);
    images(:, :, :, i) = img;
    
    exposureTimes(i) = dc.ExposureTime;
end

end

