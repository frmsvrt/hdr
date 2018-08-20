function [exifdata,nf] = getexif(fname)
% Extract metadata from given filename
% Detailed explanation goes here, or not
% use os installed exiftool to read metadata from images

toolz = '/usr/local/bin/exiftool';

% assert file is exist
if isempty(toolz) 
disp('ExifTool not available:'); 
disp('Please download from,') 
disp(' http://www.sno.phy.queensu.ca/~phil/exiftool/') 
disp('make sure that the exiftool installer has been run') 
beep 

% call for exiftool
TS=[ '"' toolz '" -s "' fname '"']; 
[status, exifdata] = system(TS);

nf = find(exifdata==':'); 
nf = length(nf); 
end