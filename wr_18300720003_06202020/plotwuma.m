function plotwuma( NO,input,FFToutput,SER )
%��������ͼ
figure(2*NO-1);
subplot(2,3,1);
scatter(real(input),imag(input));
title('����ͼ�������ź�');
subplot(2,3,2);
scatter(real(FFToutput(1,1:5*256)),imag(FFToutput(1,1:5*256)));
title('����ͼ������źţ������0dB');
subplot(2,3,3);
scatter(real(FFToutput(2,1:5*256)),imag(FFToutput(2,1:5*256)));
title('����ͼ������źţ������5dB');
subplot(2,3,4);
scatter(real(FFToutput(3,1:5*256)),imag(FFToutput(3,1:5*256)));
title('����ͼ������źţ������10dB');
subplot(2,3,5);
scatter(real(FFToutput(4,1:5*256)),imag(FFToutput(4,1:5*256)));
title('����ͼ������źţ������15dB');
subplot(2,3,6);
scatter(real(FFToutput(5,1:5*256)),imag(FFToutput(5,1:5*256)));
title('����ͼ������źţ������20dB');

%��������������
figure(2*NO);
x=[0,5,10,15,20];
semilogy(x,SER,'-o');grid on;
end


