clear all
clc
%close all
hold on

addpath('D:\Matthijs Spectrum\20171121 A10 A9')
%% experimental data
mini=240; maxi=275;
%range of signal to be integrated on real picture
delimiter = ','; nheaderlines = 0;
%load('omega_k_results.mat');
image1 = csvread('2017 November 21 16_01_17.csv',0,0);
image2 = csvread('2017 November 21 16_35_58.csv',0,0);

%image(1,:)
[heigth, width]=size(image1);
%aux = importdata('PL_LR 44.csv', delimiter, nheaderlines); I = aux.data;
%T_ang=1-transpose(T_ang);
%E=4.13566E-15*f
%theta=[0:1:20];
%lambda=Iref(:,1);
%energy=1.239./lambda*1000;
%wavelength=zeros(width);
intensity1=zeros(heigth-1,width);
wavelength1=image1(1,:);

for i=1:heigth-1;
    intensity1(i,:)=image1(i+1,:);
%        
%         Tref(j,i)=(Iref(j,i+1));
%         T(j,i)=(I(j,i+1)); 
%         
%         E(j,i)= 1-T(j,i)./Tref(j,i);
% 
end;
crossSection1=zeros(width,1);
for k=1:width;
for j=mini:maxi;
    crossSection1(k,1)=crossSection1(k,1)+intensity1(j,k);
end
end
for i=1:heigth-1;
    intensity2(i,:)=image2(i+1,:);
%        
%         Tref(j,i)=(Iref(j,i+1));
%         T(j,i)=(I(j,i+1)); 
%         
%         E(j,i)= 1-T(j,i)./Tref(j,i);
% 
end;
crossSection2=zeros(width,1);
for k=1:width;
for j=mini:maxi;
    crossSection2(k,1)=crossSection2(k,1)+intensity2(j,k);
end
end



    
%end;240 275



%% processing
%thetacut=0;
%[~, nthetacut]=min(abs(theta-thetacut));

%% figures
xlimits=[550 750];
ylimits=[0 512];
index=1:512;

figure
    pcolor(wavelength1, transpose(index), intensity1); axis square; shading flat;  colorbar('fontsize', 14)
    xlabel('wavelength'); ylabel('position'); title('');
    xlim([xlimits(1) xlimits(2)]); ylim([ylimits(1) ylimits(2)]); 
    %axis([0 10000])

   
crossSection1=crossSection1./max(crossSection1);
crossSection2=crossSection2./max(crossSection2);
figure
    plot(wavelength1, crossSection2,'linewidth', 2); axis square;
    hold on
    plot(wavelength1, crossSection1,'linewidth', 2); axis square;

    ylabel(''); xlabel('');
    xlim([xlimits(1) xlimits(2)]); ylim([0 1]); legend('')
    hold off
%figure
%    plot(f, T)
    
    
    
  