dw=0.01*pi;
dt=0.01;
t=-40:dt:40;
w=-2*pi:dw:2*pi;
G=(1-abs(w)).*(abs(w)<=1);
gt=dw*exp(j*t'*w)*G'/(2*pi);
figure
subplot(2,1,1);
plot(t',gt);
title("时域波形");
subplot(2,1,2);
plot(w,G);
title("频域波形");
gt2=gt'.*(mod(t,2)==0);
gw=2*exp(w'*t*(-j))*gt2';
figure
subplot(2,1,1);
plot(t',gt2);
title("采样后时域波形");
subplot(2,1,2);
plot(w,gw);
title("采样后频域波形");

a=[1 1 1 1 1 1 1 1 1 1 1];
k=find(abs(w)<1);
Ga=(1-abs(w(k)));
G2=kron(a,Ga);
w2=(-10.84):dw:(10.9);
gt3=dw*exp(j*t'*w2)*G2'/(2*pi);
figure
subplot(2,1,1);
plot(t',gt3);
title("延拓后时域波形");
subplot(2,1,2);
plot(w2',G2);
title("延拓后频域波形");
%%
for i=1:8001
    gt4(i)=gt(((floor(t(i)/2)*2)+40)*100+1);
end
gw4=dt*exp(w'*t*(-j))*gt4';
figure
subplot(2,1,1);
plot(t',gt4,t',gt);
title("延拓后时域波形");
legend("零阶保持采样","未采样");
subplot(2,1,2);
plot(w',gw4,w',G);
legend("零阶保持采样","未采样");
title("延拓后频域波形");