% Manusreehasa Gangavamsam
% 21GG10024

% 23rd March 2023
%u_tt=a^2u_xx

clear;clc;
%Wave Equation
%CTCS

a=1;
L=10;

dx=1e-1;
x=0:dx:L;
mx=length(x);

dt=0.5*1e-1;
stopTime=20;
t=0:dt:stopTime;
mt=length(t);


lambda=((dt^2)*(a^2))/(dx^2);


%A=zeros(length(0:dt:stopTime),mx);
%% Initial conditions
current=(L/2)-(L/2)*cos((2*pi/L).*x);
past=current;
fut=zeros(1,mx);
%fut=zeros(1,mx);

A=zeros(mt,mx);
A(1,:)=current;


%% Solution

figure(1);
plot(x,current,'-r','Linewidth',2);
hold on;

for j=2:mt
    

    %Boundary conditions

    fut(1)=0;
    fut(mx)=0;

    fut(2:mx-1)=(2*current(2:mx-1))-past(2:mx-1)+...
        lambda*(current(1:mx-2)-2*current(2:mx-1)+current(3:mx));

    %Swap the values for the next iteration

    past=current;
    current=fut;
    A(j,:)=fut;
   

    plot(x,fut,'b','Linewidth',3);
    title({'1-D Wave Equation';...
        ['time(\itt)=',num2str((j-1)*dt)]})
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
    hold on;
    grid on;
    axis([0 L -10 10]);

    hold off;
    pause(0.01);
end
figure(2);
surf(x,t,A,'Edgecolor','none');colormap(jet);colorbar;
axis square;
%surf is for surface plot

% [X,T]=meshgrid(x,t);
% 
% U=6.*sin((pi/L).*X).*exp((-k.*T).*(pi./L).^2);
% 
% %Analytical
% figure(3);
% surf(X,T,U,'Edgecolor','none');colormap(jet);colorbar;
% axis square;
% 
% xlabel('$x$','Interpreter','latex','FontSize',20);
