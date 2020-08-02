function [FFToutput,output,error] = OFDM( N,input,n_channel,SN )


%�����źŵĴ���/���б任
count=0;
concurrent=zeros(N,256);
for i=1:1:N
    for j=1:1:256
        concurrent(i,j)=input(1,count+j);
    end
    count=count+256;
end

%OFDMϵͳ
%�Բ��������źŽ���IFFT
OFDMinput=zeros(N,256);
for i=1:1:N
    OFDMinput(i,:)=sqrt(256)*ifft(concurrent(i,:));
end
%�Բ��������źŲ��뱣�����
OFDMprotect=zeros(N,272);
for i=1:1:N
    for j=1:1:16
        OFDMprotect(i,j)=OFDMinput(i,240+j);
    end
    for j=1:1:256
        OFDMprotect(i,j+16)=OFDMinput(i,j);
    end
end

%��OFDM������źŽ��жྶ����������ak^2������ȷֲ�
h=zeros(N,n_channel);
for i=1:1:N
   h(i,:)=0.5.^0.5.*complex((randn(1,n_channel)),randn(1,n_channel));
end

y0=zeros(N,272);
temp=zeros(N,272+n_channel-1);
for i=1:1:N
    temp(i,:)=conv(h(i,:),OFDMprotect(i,:));
    y0(i,:)=temp(i,1:272);
end

%Pn=10^((0-SN)/10);%���������ƽ������

y0=awgn(y0,SN,'measured');%���������뵽�ྶ�����������y0��

%��OFDMϵͳ
%ȥ����������������д�/����ת��
FOFDM=zeros(N,256);
for i=1:1:N
    for j=1:1:256
        FOFDM(i,j)=y0(i,16+j);
    end
end

%��FOFDM����DFT��FFT
FFTout=zeros(N,256);
for i=1:1:N
    FFTout(i,:)=1/sqrt(256)*fft(FOFDM(i,:));
end
%����
H=zeros(N,256);
for i=1:1:N
    H(i,:)=fft(h(i,:),256);
end
for i=1:1:N
    FFTout(i,:)=FFTout(i,:)./H(i,:);
end


%��/��ת��
FFToutput=zeros(1,(256*N));
count=0;
for i=1:1:N
    for j=1:1:256
        FFToutput(1,count+j)=FFTout(i,j);
    end
    count=count+256;
end

%�о�
output=zeros(1,(256*N));
for i=1:(256*N)
    if real(FFToutput(1,i))>0
        output(1,i)=1;
    else
        output(1,i)=0;
    end
end

%����������
error=sum(abs(output-input))/(256*N);
end