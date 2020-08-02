clear all
N=3000;
input=round(rand(1,256*N));
uwFFToutput=zeros(5,256*N);
uwoutput=zeros(5,256*N);
uwser=zeros(1,5);
for i=1:1:5
    [uwFFToutput(i,:),uwoutput(i,:),uwser(1,i)]=OFDM(N,input,1,(i-1)*5);
end
figure
plotwuma(2,input,uwFFToutput,uwser);
h1=figure(3);
set(h1,'name','����ͼ���ŵ���ͷϵ��1�����ʸ���˹�ֲ�','Numbertitle','off');
h2=figure(4);
set(h2,'name','���������ߣ��ŵ���ͷϵ��1�����ʸ���˹�ֲ�','Numbertitle','off');
%%
clear all
N=1000;
input=round(rand(1,256*N));
uwFFToutput=zeros(5,256*N);
uwoutput=zeros(5,256*N);
uwser=zeros(1,5);
for i=1:1:5
    [uwFFToutput10(i,:),uwoutput10(i,:),uwser10(1,i)]=OFDM(N,input,10,(i-1)*5);
end

plotwuma(1,input,uwFFToutput10,uwser10);
h3=figure(1);
set(h3,'name','����ͼ���ŵ���ͷϵ��10�����ʸ���˹�ֲ�','Numbertitle','off');
h4=figure(2);
set(h4,'name','���������ߣ��ŵ���ͷϵ��10�����ʸ���˹�ֲ�','Numbertitle','off');

