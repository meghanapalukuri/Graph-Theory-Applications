function f=fun2(e,T,FCp)

f=e(4);
% H=zeros(4,5); % Enthalpy flows
% H(1,:)=[(T(1,1)*FCp(1)),(270+e(2)-e(4)),(420+e(3)-e(4)),(480-e(4)),(T(1,5)*FCp(1))];
% H(2,:)=[(T(2,1)*FCp(2)),(300+e(3)),(222+e(1)),(T(2,4)*FCp(2)),0];
% H(3,:)=[(T(3,1)*FCp(3)), (220+e(1)),(260+e(1)-e(3)),(T(3,4)*FCp(3)),0];
% H(4,:)=[(T(4,1)*FCp(4)), (450+e(2)-e(3)), (410+e(2)), (320+e(4)),(T(4,5)*FCp(4))];
% 
% Q=zeros(9,1); % Heat loads
% Q(1)=H(2,1)-H(2,2); 
% Q(2)=H(4,1)-H(4,2); 
% Q(3)=-(H(3,3)-H(3,4)); 
% Q(4)=H(2,2)-H(2,3); 
% Q(5)=-(H(1,1)-H(1,2)); 
% Q(6)=-(H(3,1)-H(3,2)); 
% Q(7)=-(H(1,4)-H(1,5)); 
% Q(8)=H(4,4)-H(4,5); 
% 
% % Q(1)=(48+e(1)+e(2))-(38.01+e(1)-e(5)); 
% % Q(2)=(26+e(2)+e(5))-(56+e(2)+e(4));
% % Q(3)=(56.01+e(1)+e(3))-(48+e(1)+e(2));
% % Q(4)=(81.99+e(3)+e(4))-(72+e(4));
% % Q(5)=(93.96+e(3))-(127.98-e(1));
% % Q(6)=(200*0.45)-(81.99+e(3)+e(4));
% % Q(7)=(38.01+e(1)-e(5))-(80*0.3);
% % Q(8)=(41.985+e(5))-(40*0.45);
% % Q(9)=40.02+e(1);
% 
% delT(1)=((T(2,1)-T(1,4))-(T(2,2)-T(1,3)))/(log(T(2,1)-T(1,4))-log(T(2,2)-T(1,3)));
% delT(2)=((T(4,1)-T(1,3))-(T(4,2)-T(1,2)))/(log(T(4,1)-T(1,3))-log(T(4,2)-T(1,2)));
% delT(3)=((T(2,2)-T(3,4))-(T(2,3)-T(3,3)))/(log(T(2,2)-T(3,4))-log(T(2,3)-T(3,3)));
% delT(4)=((T(4,2)-T(3,3))-(T(4,3)-T(3,2)))/(log(T(4,2)-T(3,3))-log(T(4,3)-T(3,2)));
% delT(5)=((T(4,3)-T(1,2))-(T(4,4)-T(1,1)))/(log(T(4,3)-T(1,2))-log(T(4,4)-T(1,1)));
% delT(6)=((T(2,3)-T(3,2))-(T(2,4)-T(3,1)))/(log(T(2,3)-T(3,2))-log(T(2,4)-T(3,1)));
% 
% A=zeros(6,1);
% c=zeros(9,1);
% for i=1:6
%     A(i)=Q(i)/(0.4*delT(i));
%     c(i)=300*(1.1^10)*(A(i)^0.5);
% end
% 
% c(7)=12.2*Q(7);
% c(8)=12.2*Q(8);
% 
% f=sum(c);
end