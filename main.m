clear
clc

filename = input('Enter Audio File Name (.WAV): ','s');
[y, Fs] = audioread(filename);
newFs=Fs;
Fn=Fs/2;
FilterType=input('Enter 1 for IIR or 2 for FIR: ');
g1=db2mag(input(' Enter gain for range of frequencies(0-170 Hz): '));
g2=db2mag(input(' Enter gain for range of frequencies(170-310 Hz): '));
g3=db2mag(input(' Enter gain for range of frequencies(310- 600 Hz): '));
g4=db2mag(input(' Enter gain for range of frequencies(600- 1000 Hz): '));
g5=db2mag(input(' Enter gain for range of frequencies(1- 3 KHz): '));
g6=db2mag(input(' Enter gain for range of frequencies(3- 6 KHz): '));
g7=db2mag(input(' Enter gain for range of frequencies(6-12 KHz): '));
g8=db2mag(input(' Enter gain for range of frequencies(12-14 KHz): '));
g9=db2mag(input(' Enter gain for range of frequencies(14-16 KHz): '));
gain=[g1 g2 g3 g4 g5 g6 g7 g8 g9];
range=[0 170 310 600 1000 3000 6000 12000 14000 16000];
Z=zeros(9,21);
P=zeros(9,21); 
if max( range /(Fs/2) ) >0.999 %if sample rate causes Wn >1 normalize so that the largest Wn is 0.999
    newFs=2*max(range)/0.99;
    
end
Fn=newFs/2;
range=range./Fn;
if newFs~=Fs
    y = resample(y,ceil(newFs/Fs) ,1); %AUTOMATIC RESAMPLE
end

%play(player);

dt = 1/newFs;
N=length(y);
t = linspace(0,N/newFs,N);
%t = 0:dt:(length(y)*dt)-dt;



if FilterType == 1 
    

[z1, p1] = butter(5,170/Fn ,'low');

data1 = g1*filter(z1,p1,y);

[z2,p2] = butter(3,[170/Fn 310/Fn] ,'bandpass');

data2 = g2*filter(z2,p2,y);


[z3,p3] = butter(4,[310/Fn 600/Fn] ,'bandpass');

data3 = g3*filter(z3,p3,y);

[z4,p4] = butter(5,[600/Fn 1000/Fn] ,'bandpass');

data4 = g4*filter(z4,p4,y);

[z5,p5] = butter(8,[1000/Fn 3000/Fn] ,'bandpass');

data5 = g5*filter(z5,p5,y);

[z6,p6] = butter(13,[3000/Fn 6000/Fn] ,'bandpass');

data6 = g6*filter(z6,p6,y);

[z7,p7] = butter(20,[6000/Fn 12000/Fn] ,'bandpass');


data7 = g7*filter(z7,p7,y);

[z8,p8] = butter(10,[12000/Fn 14000/Fn] ,'bandpass');

data8 = g8*filter(z8,p8,y);

[z9,p9] = butter(5,[14000/Fn 16000/Fn] ,'bandpass');

data9 = g9*filter(z9,p9,y);


 subplot(3,3,1);
 stepz(z1,p1);
 subplot(3,3,2);
 stepz(z2,p2);
 subplot(3,3,3);
 stepz(z3,p3);
 subplot(3,3,4);
 stepz(z4,p4);
 subplot(3,3,5);
 stepz(z5,p5);
 subplot(3,3,6);
 stepz(z6,p6);
 subplot(3,3,7);
 stepz(z7,p7);
 subplot(3,3,8);
 stepz(z8,p8);
 subplot(3,3,9);
 stepz(z9,p9);
 
 figure;
 
 subplot(3,3,1);
 pzmap(z1,p1);
  subplot(3,3,2);
 pzmap(z2,p2);
  subplot(3,3,3);
pzmap(z3,p3);
  subplot(3,3,4);
 pzmap(z4,p4);
  subplot(3,3,5);
 pzmap(z5,p5);
  subplot(3,3,6);
 pzmap(z6,p6);
  subplot(3,3,7);
 pzmap(z7,p7);
  subplot(3,3,8);
 pzmap(z8,p8);
  subplot(3,3,9);
 pzmap(z9,p9);
 
 figure;

 freqz(z1,p1);
figure;
 freqz(z2,p2);
 figure;
freqz(z3,p3);
figure;
 freqz(z4,p4);
 figure;
 freqz(z5,p5);
 figure;
 freqz(z6,p6);
figure;
freqz(z7,p7);
figure;
 freqz(z8,p8);
 figure;
 freqz(z9,p9);
 
 figure;

  subplot(3,3,1);
 impz(z1,p1);
  subplot(3,3,2);
 impz(z2,p2);
  subplot(3,3,3);
 impz(z3,p3);
  subplot(3,3,4);
 impz(z4,p4);
  subplot(3,3,5);
 impz(z5,p5);
  subplot(3,3,6);
 impz(z6,p6);
  subplot(3,3,7);
 impz(z7,p7);
  subplot(3,3,8);
 impz(z8,p8);
  subplot(3,3,9);
 impz(z9,p9);
 

        
else
z1 = fir1(50,170/Fn ,'low');

data1 = g1*filter(z1,1,y);

z2 = fir1(50,[170/Fn 310/Fn] ,'bandpass');

data2 = g2*filter(z2,1,y);


z3 = fir1(50,[310/Fn 600/Fn] ,'bandpass');

data3 = g3*filter(z3,1,y);

z4 = fir1(50,[600/Fn 1000/Fn] ,'bandpass');

data4 = g4*filter(z4,1,y);

z5 = fir1(50,[1000/Fn 3000/Fn] ,'bandpass');

data5 = g5*filter(z5,1,y);

z6 = fir1(50,[3000/Fn 6000/Fn] ,'bandpass');

data6 = g6*filter(z6,1,y);

z7 = fir1(50,[6000/Fn 12000/Fn] ,'bandpass');


data7 = g7*filter(z7,1,y);

z8 = fir1(50,[12000/Fn 14000/Fn] ,'bandpass');

data8 = g8*filter(z8,1,y);

z9 = fir1(50,[14000/Fn 16000/Fn] ,'bandpass');

data9 = g9*filter(z9,1,y);

 subplot(3,3,1);
 stepz(z1,1);
 subplot(3,3,2);
 stepz(z2,1);
 subplot(3,3,3);
 stepz(z3,1);
 subplot(3,3,4);
 stepz(z4,1);
 subplot(3,3,5);
 stepz(z5,1);
 subplot(3,3,6);
 stepz(z6,1);
 subplot(3,3,7);
 stepz(z7,1);
 subplot(3,3,8);
 stepz(z8,1);
 subplot(3,3,9);
 stepz(z9,1);
 
 figure;
 
 subplot(3,3,1);
 pzmap(z1,1);
 subplot(3,3,2);
 pzmap(z2,1);
 subplot(3,3,3);
 pzmap(z3,1);
 subplot(3,3,4);
 pzmap(z4,1);
 subplot(3,3,5);
 pzmap(z5,1);
 subplot(3,3,6);
 pzmap(z6,1);
 subplot(3,3,7);
 pzmap(z7,1);
 subplot(3,3,8);
 pzmap(z8,1);
 subplot(3,3,9);
 pzmap(z9,1);
 figure;

 freqz(z1,1);
 figure;
 freqz(z2,1);
 figure;
 freqz(z3,1);
 figure;
 freqz(z4,1);
 figure;
 freqz(z5,1);
 figure;
 freqz(z6,1);
 figure;
 freqz(z7,1);
 figure;
 freqz(z8,1);
 figure;
 freqz(z9,1);
 
 figure;
 subplot(3,3,1);
 impz(z1,1);
 subplot(3,3,2);
 impz(z2,1);
 subplot(3,3,3);
 impz(z3,1);
 subplot(3,3,4);
 impz(z4,1);
 subplot(3,3,5);
 impz(z5,1);
 subplot(3,3,6);
 impz(z6,1);
 subplot(3,3,7);
 impz(z7,1);
 subplot(3,3,8);
 impz(z8,1);
 subplot(3,3,9);
 impz(z9,1);
end

output = data1+data2+data3+data4+data5+data6+data7+data8+data9;
figure;
subplot(2,1,1);
plot(t,y);
title('Input Signal in time domain');
subplot(2,1,2);
plot(t,output);
title('Composite Signal in time domain');

figure;

subplot(2,1,1);
Y=abs(fftshift(fft(y)));
n=length(Y);
f=linspace(-newFs/2,newFs/2,n);
plot(f,Y);
title('Input Signal in frequency domain');
subplot(2,1,2);
output_f=abs(fftshift(fft(output)));
n=length(output_f);
f=linspace(-newFs/2,newFs/2,n);
plot(f,output_f);
title('Composite Signal in frequency domain');


audiowrite('output.wav',output,ceil(newFs));

