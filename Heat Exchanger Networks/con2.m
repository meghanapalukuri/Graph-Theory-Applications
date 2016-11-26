function [c,ceq]=con2(e,T,FCp,delTmin)

%% Calculation of Updated Temp
H=zeros(4,5); % Enthalpy flows
H(1,:)=[(T(1,1)*FCp(1)),(270+e(2)-e(4)),(420+e(3)-e(4)),(480-e(4)),(T(1,5)*FCp(1))];
H(2,:)=[(T(2,1)*FCp(2)),(300+e(3)),(222+e(1)),(T(2,4)*FCp(2)),0];
H(3,:)=[(T(3,1)*FCp(3)), (220+e(1)),(260+e(1)-e(3)),(T(3,4)*FCp(3)),0];
H(4,:)=[(T(4,1)*FCp(4)), (450+e(2)-e(3)), (410+e(2)), (320+e(4)),(T(4,5)*FCp(4))];

Q=zeros(8,1); % Heat loads
Q(1)=H(2,1)-H(2,2); 
Q(2)=H(4,1)-H(4,2); 
Q(3)=-(H(3,3)-H(3,4)); 
Q(4)=-(H(3,2)-H(3,3)); 
Q(5)=-(H(1,1)-H(1,2)); 
Q(6)=-(H(3,1)-H(3,2)); 
Q(7)=-(H(1,4)-H(1,5)); 
Q(8)=H(4,4)-H(4,5); 

% Updated Temperatures
FCP=(repmat(FCp,5,1))';
T=H./FCP;

%% Constraints
% delta Tmin constraints - - Uncomment according to the choice of HEX to be deleted
c(1)=delTmin-(T(2,1)-T(1,4)); % HEX1
c(2)=delTmin-(T(2,2)-T(1,3));
% c(3)=delTmin-(T(4,1)-T(1,3)); % HEX 2
% c(4)=delTmin-(T(4,2)-T(1,2));
c(5)=delTmin-(T(2,2)-T(3,4)); % HEX 3
c(6)=delTmin-(T(2,3)-T(3,3));
% c(7)=delTmin-(T(4,2)-T(3,3)); % HEX 4
% c(8)=delTmin-(T(4,3)-T(3,2));
% c(7)=delTmin-(T(4,3)-T(1,2));  % HEX 5
% c(8)=delTmin-(T(4,4)-T(1,1));
% c(9)=delTmin-(T(2,3)-T(3,2));  % HEX 6
% c(10)=delTmin-(T(2,4)-T(3,1));

% Deleting HEX - Uncomment according to the choice of HEX to be deleted
% ceq(2)=Q(3);
ceq(4)=Q(2);
ceq(1)=Q(4);
ceq(2)=Q(5);
ceq(3)=Q(6);

% Positive heat load constraints
c(3)=-Q(1);
c(4)=-Q(3);
% c(9)=-Q(2);
%c(14)=-Q(4);
% c(5)=-Q(5);
% c(6)=-Q(6);
c(7)=-Q(7);
c(8)=-Q(8);

end