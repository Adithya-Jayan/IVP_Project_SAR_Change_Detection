%%�������ݶ�ȡ��Ԥ����Ԥ����������RGBתΪ�Ҷ�ͼ��ѡ����ʵ�ѵ�����ݵ㣬�Ա�֮���ٽ�������������Ͷ�������н���Ԥѵ����

clc;
clear all;
%%
% %%��Bern-SARͼƬΪ��
BernSAR_im1=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Bern-SAR/im1.bmp');
BernSAR_im1=rgb2gray(BernSAR_im1);
BernSAR_im2=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Bern-SAR/im2.bmp');
BernSAR_im2=rgb2gray(BernSAR_im2);
% %BernSAR_im3=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Bern-SAR/im3.bmp');
% %BernSAR_im3=rgb2gray(BernSAR_im3);%groundtruth
% BernSAR_changed_map=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Bern-SAR/changed_map.bmp');
% BernSAR_changed_map=rgb2gray(BernSAR_changed_map);%��ͳ�����õ��Ľ��
% %PS:��1210����Ϊֵ255�����仯��
%%
%%Ottawa-SAR
%%
OttawaSAR_im1=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Ottawa-SAR/im1.bmp');
OttawaSAR_im1=rgb2gray(OttawaSAR_im1);
OttawaSAR_im2=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Ottawa-SAR/im2.bmp');
OttawaSAR_im2=rgb2gray(OttawaSAR_im2);
OttawaSAR_changed_map=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Ottawa-SAR/changed_map.bmp');
OttawaSAR_changed_map=rgb2gray(OttawaSAR_changed_map);%��ͳ�����õ��Ľ��
%%
%%Yellow_River
Yellow_River_im1=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Yellow River I-SAR/im1.bmp');
Yellow_River_im2=imread('C:/Users/HAOCHENG/Desktop/DBN���������ע�ͣ�/example/Yellow River I-SAR/im2.bmp');



%vec_BernSAR_im1 = reshape(BernSAR_im1,1,size(BernSAR_im1,1)*size(BernSAR_im1,2));
%save('vec.mat','vec_BernSAR_im1');
figure(1);
subplot(2,2,1);imshow(OttawaSAR_im1);
title('BernSAR-im1');
subplot(2,2,2);imshow(OttawaSAR_im2);
title('BernSAR-im2');
%subplot(2,2,3);imshow(BernSAR_im3);
%title('BernSAR-im3');

subplot(2,2,3);imshow(OttawaSAR_changed_map);
title('BernSAR-changed-map');
%%����ѡ����ʵ�������
check=choose_Sample(OttawaSAR_changed_map);
subplot(2,2,4);imshow(check);
title('BernSAR-changed-map1');











