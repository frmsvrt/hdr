function [images, exposureTime] = readData(folder)
% function readData
% input folder dir
% read images from the folder and their exposure time

images = [];
exposureTime = [];
files = dir([folder, '/*.jpg']);
fnames = [folder, '/', files(1).name];
info = imfinfo(fnames);
number = length(files);
images = zeros(info.Height, info.Width, info.NumberOfSamples, number);
exposureTimes = zeros(number, 1);

for i=1:number
    fname = [folder, '/', files(1).name];
    img = imread(fname);
    images(:, :, :, i) = img;
    
    exif = getexif(fname);
    exposureTimes(i) = exif.ExposureTime;
end

end

