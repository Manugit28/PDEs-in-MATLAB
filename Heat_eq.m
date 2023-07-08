% Manusreehasa Gangavamsam
% 21GG10024

clear;clc;
% Heat Equation

k=1;
% Length of rod
L=1;
% dx is the 
dx=1e-2;
x=0:dx:L;

dt=0.5*1e-4;
stopTime=0.01;

mx=(L/dx)+1;

lambda=(dt*k^2)/(dx^2);

t1=0:dt:stopTime;
A=zeros(length(0:dt:stopTime),mx);
% Initial conditions
%current=10*cos((2*pi/L).*x);
current=6*sin((pi/L).*x);
fut=zeros(1,mx);

A(1,:)=current;


% Solution

figure(1);
plot(x,current,'r','Linewidth',2);
hold on;

i=2;


for t=dt:dt:stopTime
    

    %Boundary conditions

    fut(1)=0;
    fut(mx)=0;

    fut(2:mx-1)=(lambda*current(1:mx-2))+(1-2*lambda)*current(2:mx-1)+...
        (lambda*current(3:mx));

    %Swap the values for the next iteration

    current=fut;
    A(i,:)=fut;
    i=i+1;

    plot(x,fut,'b','Linewidth',3);
    title({'1-D Heat Equation';...
        ['time(\itt)=',num2str(t)]})
    xlabel('Spatial co-ordinate (x) \rightarrow')
    ylabel('Transport property profile (u) \rightarrow')
    hold on;
    grid on;
    axis([0 L -10 10]);

    hold off;
    pause(0.01);
end
figure(2);
surf(x,t1,A,'Edgecolor','none');colormap(jet);colorbar;
axis square;
%surf is for surface plot

[X,T]=meshgrid(x,t1);

U=6.*sin((pi/L).*X).*exp((-k.*T).*(pi./L).^2);

%Analytical
figure(3);
surf(X,T,U,'Edgecolor','none');colormap(jet);colorbar;
axis square;

xlabel('$x$','Interpreter','latex','FontSize',20);
