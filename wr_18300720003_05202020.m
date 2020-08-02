%%
dt=0.01;
dw=0.05*pi;
t=-1:dt:2;
w=-16*pi:dw:16*pi;
v=(t>0).*(t<1);
H=10./(10+j.*w);
ht=dw*exp(j*t'*w)*H'/(2*pi);
y=conv(ht,v')*dt;
figure
subplot(2,1,1);
t2=-2:dt:4;
plot(t2,y);
title("����һ");
xlim([-1 2]);
Fw=dt*exp(w'*t*(-j))*v';
yw=H.*Fw';
y2=dw*exp(j*t'*w)*yw'/(2*pi);
subplot(2,1,2);
plot(t,y2);
title("������");
figure



subplot(4,1,1);
plot(t,v);
title("����");
subplot(4,1,2);
plot(t,y2);
title("���");
subplot(4,1,3);
plot(t,ht);
title("��λ�����Ӧ");
subplot(4,1,4);
plot(w,H);
title("��λ���Ƶ��");
%%
clear all
dt=0.01;
dw=0.01*pi;
t=-2:dt:2;
w=-40*pi:dw:40*pi;
H1=(w>-2*pi).*(w<2*pi);
H2=(w>-8*pi).*(w<8*pi);
H3=(w>-32*pi).*(w<32*pi);
h1=dw*exp(j*t'*w)*H1'/(2*pi);
h2=dw*exp(j*t'*w)*H2'/(2*pi);
h3=dw*exp(j*t'*w)*H3'/(2*pi);
figure
subplot(3,1,1);
plot(t,h1);
title("2pi");
subplot(3,1,2);
plot(t,h2);
title("8pi");
subplot(3,1,3);
plot(t,h3);
title("32pi");

t2=-4:dt:4;
f=(t>-0.5).*(t<0.5);
Fw=dt*exp(w'*t*(-j))*f';
figure
subplot(2,1,1);
plot(t,f);
title("�����ź�");
subplot(2,1,2);
plot(w,Fw);
title("�����ź�Ƶ��");


f1=conv(f,h1');
f1=f1(201:601);
f2=conv(f,h2');
f2=f2(201:601);
f3=conv(f,h3');
f3=f3(201:601);
fw1=dt*exp(w'*t*(-j))*f1';
fw2=dt*exp(w'*t*(-j))*f2';
fw3=dt*exp(w'*t*(-j))*f3';
figure
subplot(3,1,1);

plot(t,f1);
title("������һ���˲�����ʱ��");
subplot(3,1,2);
plot(t,f2);
title("�����ڶ����˲�����ʱ��");
subplot(3,1,3);
plot(t,f3);
title("�����������˲�����ʱ��");
figure
subplot(3,1,1);

plot(w,fw1);
title("������һ���˲�����Ƶ��");
subplot(3,1,2);
plot(w,fw2);
title("�����ڶ����˲�����Ƶ��");
subplot(3,1,3);
plot(w,fw3);
title("�����������˲�����Ƶ��");

