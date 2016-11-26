clc
clear all
close all

FCp=[3,2,2.6,4];
delTmin=10;
%% Original 
T=[60,90,140,160,180; 180,150,111,40,0;30,84.6,100,130,0; 150,112.5,102.5,80,40];

e=zeros(4,1); % Loop Loads

H=zeros(4,5); % Enthalpy flows
H(1,:)=[(T(1,1)*FCp(1)),(270+e(2)-e(4)),(420+e(3)-e(4)),(480-e(4)),(T(1,5)*FCp(1))];
H(2,:)=[(T(2,1)*FCp(2)),(300+e(3)),(222+e(1)),(T(2,4)*FCp(2)),0];
H(3,:)=[(T(3,1)*FCp(3)), (220+e(1)),(260+e(1)-e(3)),(T(3,4)*FCp(3)),0];
H(4,:)=[(T(4,1)*FCp(4)), (450+e(2)-e(3)), (410+e(2)), (320+e(4)),(T(4,5)*FCp(4))];

Q=zeros(8,1); % Heat loads
Q(1)=H(2,1)-H(2,2); 
Q(2)=H(4,1)-H(4,2); 
Q(3)=-(H(3,3)-H(3,4)); 
Q(4)=H(4,2)-H(4,3); 
Q(5)=-(H(1,1)-H(1,2)); 
Q(6)=-(H(3,1)-H(3,2)); 
Q(7)=-(H(1,4)-H(1,5)); 
Q(8)=H(4,4)-H(4,5)

%% With Deletion of HEX
sol0=zeros(4,1);

obj=@(e)e(4);
constr=@(e)con2(e,T,FCp,delTmin);
[LoopLoads,EnergyPenalty]=fmincon(obj,sol0,[],[],[],[],[],[],constr)
%[LoopLoads,EnergyPenalty]=ga(obj,4,[],[],[],[],[],[],constr)

e=LoopLoads;
H=zeros(4,5); % Enthalpy flows
H(1,:)=[(T(1,1)*FCp(1)),(270+e(2)-e(4)),(420+e(3)-e(4)),(480-e(4)),(T(1,5)*FCp(1))];
H(2,:)=[(T(2,1)*FCp(2)),(300+e(3)),(222+e(1)),(T(2,4)*FCp(2)),0];
H(3,:)=[(T(3,1)*FCp(3)), (220+e(1)),(260+e(1)-e(3)),(T(3,4)*FCp(3)),0];
H(4,:)=[(T(4,1)*FCp(4)), (450+e(2)-e(3)), (410+e(2)), (320+e(4)),(T(4,5)*FCp(4))];

Q=zeros(8,1); % Heat loads
Q(1)=H(2,1)-H(2,2); 
Q(2)=H(4,1)-H(4,2); 
Q(3)=-(H(3,3)-H(3,4)); 
Q(4)=H(4,2)-H(4,3); 
Q(5)=-(H(1,1)-H(1,2)); 
Q(6)=-(H(3,1)-H(3,2)); 
Q(7)=-(H(1,4)-H(1,5)); 
Q(8)=H(4,4)-H(4,5)

% Updated Temperatures
FCP=(repmat(FCp,5,1))';
T=H./FCP;
