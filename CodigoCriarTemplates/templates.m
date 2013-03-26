function [ output_args ] = templates( input_args )
%TEMPLATES Summary of this function goes here
%   Detailed explanation goes here
for i=1 : 10
    string='C:\Users\PC\Desktop\Template3\';
    string1=num2str(i);
    string1=strcat(string,string1);
    string2=strcat(string1,'.bmp');
    %fprintf('\n%s',string2);
    img=imread(string2);
    img = swap(img);
    img = bwmorph(img,'thin',Inf);
    imgdone = swap(img);
    threshold = graythresh(imgdone);
    imgdone =~im2bw(imgdone,threshold);
    [imgfinal,l]=lines(imgdone);
    imgfinal=imresize(imgfinal,[15 15]);
    imgfinal=swap(imgfinal);
    
    string3='C:\Users\PC\Desktop\Template3_personalizado\';
    string4=num2str(i);
    string5=strcat(string3,string4);
    string6=strcat(string5,'.bmp');
    imwrite(imgfinal, string6);
end

end

