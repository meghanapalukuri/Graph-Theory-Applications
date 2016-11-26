%% PART 2
clc
clear all
close all

%% SPANNING TREE 1
%% VARIABLE INITIALIZATION

D=[1, 2, 3 , 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];

Q=[100,370,570,900,1020,1120];

k1=1:length(D);
for i=1:length(D)
    PD1(i)=(162.9*1000*(Q(1)/130)^(1.85))/D(i)^(4.87);
end
Cost1= 1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k2=1:length(D);
for i=1:length(D)
    PD2(i)=162.9*1000*(Q(2)/130)^(1.85)/D(i)^(4.87);
end
Cost2=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k3=1:length(D);
for i=1:length(D)
    PD3(i)=162.9*1000*(Q(3)/130)^(1.85)/D(i)^(4.87);
end
Cost3=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k4=1:length(D);
for i=1:length(D)
    PD4(i)=162.9*1000*(Q(4)/130)^(1.85)/D(i)^(4.87);
end
Cost4=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k5=1:length(D);
for i=1:length(D)
    PD5(i)=162.9*1000*(Q(5)/130)^(1.85)/D(i)^(4.87);
end
Cost5=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k6=1:length(D);
for i=1:length(D)
    PD6(i)=162.9*1000*(Q(6)/130)^(1.85)/D(i)^(4.87);
end
Cost6=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

%% DISCRETE MERGING

% SERIES MERGE OF 7&8
[PDeq1, Costeq1, Diaeq1]= SeriesMerge(k1,k2,D',D',PD1,PD2,Cost1,Cost2);
% SERIES MERGE OF (7,8)&6
keq1=1:length(Diaeq1);
[PDeq2, Costeq2, Diaeq2]= SeriesMerge(keq1,k3,Diaeq1,D',PDeq1,PD3,Costeq1,Cost3);

% SERIES MERGE OF (7,8,6)&5
keq2=1:length(Diaeq2);
[PDeq3, Costeq3, Diaeq3]= SeriesMerge(keq2,k4,Diaeq2,D',PDeq2,PD4,Costeq2,Cost4);

% SERIES MERGE OF (7,8,6,5)&3
keq3=1:length(Diaeq3);
[PDeq4, Costeq4, Diaeq4]= SeriesMerge(keq3,k5,Diaeq3,D',PDeq3,PD5,Costeq3,Cost5);

% SERIES MERGE OF (7,8,6,5,3)&1
keq4=1:length(Diaeq4);
[PDeq5, Costeq5, Diaeq5]= SeriesMerge(keq4,k6,Diaeq4,D',PDeq4,PD6,Costeq4,Cost6);

%% CHECKING HEAD CONSTRAINTS OF FINAL OPTIONS

for i=1:length(PDeq5)
    TotalPD(i)=PDeq5(i);
    if(TotalPD(i)<=20 && TotalPD(i)>0)
        Sol=i;
        OptDia=Diaeq5(Sol,:);
        OptPD=PDeq5(Sol);
        OptCost=Costeq5(Sol);
        
        H2=210-(162.9*1000*(Q(6)/130)^(1.85))/OptDia(6)^(4.87);
        H4=H2-(162.9*1000*(Q(5)/130)^(1.85))/OptDia(5)^(4.87);
        H6=H4-(162.9*1000*(Q(4)/130)^(1.85))/OptDia(4)^(4.87);
        H7=H6-(162.9*1000*(Q(3)/130)^(1.85))/OptDia(3)^(4.87);
        H5=H7-(162.9*1000*(Q(2)/130)^(1.85))/OptDia(2)^(4.87);
        H3=H5-(162.9*1000*(Q(1)/130)^(1.85))/OptDia(1)^(4.87);
       % if(H6>=195)
            if(H6>=195 && H3>=190 && H4>=185 && H5>=180 && H7>= 190) % H2 is always satisfied if these are satisfied –Use here for any general spanning tree after removing above if 
           
            H2=H2
            H3=H3
            H4=H4
            H5=H5
         H6=H6
         H7=H7
          OptDia=OptDia
            OptCost=OptCost
            break;
        end
    end
end

%% SPANNING TREE 11
%% VARIABLE INITIALIZATION

D=[1, 2, 3 , 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24];

Q=[270,470,800,920,100,1120];

% K1 2 3 4 5 6 CORRESPOND TO LINKS  8 6 5 3 2 1

k1=1:length(D);
for i=1:length(D)
    PD1(i)=(162.9*1000*(Q(1)/130)^(1.85))/D(i)^(4.87);
end
Cost1= 1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k2=1:length(D);
for i=1:length(D)
    PD2(i)=162.9*1000*(Q(2)/130)^(1.85)/D(i)^(4.87);
end
Cost2=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k3=1:length(D);
for i=1:length(D)
    PD3(i)=162.9*1000*(Q(3)/130)^(1.85)/D(i)^(4.87);
end
Cost3=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k4=1:length(D);
for i=1:length(D)
    PD4(i)=162.9*1000*(Q(4)/130)^(1.85)/D(i)^(4.87);
end
Cost4=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k5=1:length(D);
for i=1:length(D)
    PD5(i)=162.9*1000*(Q(5)/130)^(1.85)/D(i)^(4.87);
end
Cost5=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

k6=1:length(D);
for i=1:length(D)
    PD6(i)=162.9*1000*(Q(6)/130)^(1.85)/D(i)^(4.87);
end
Cost6=1000*[2,5,8,11,16,23,32,50,60,90,130,170,300,550];

%% DISCRETE MERGING

% SERIES MERGE OF 8&6
[PDeq1, Costeq1, Diaeq1]= SeriesMerge(k1,k2,D',D',PD1,PD2,Cost1,Cost2);

% SERIES MERGE OF (8,6)&5
keq1=1:length(Diaeq1);
[PDeq2, Costeq2, Diaeq2]= SeriesMerge(keq1,k3,Diaeq1,D',PDeq1,PD3,Costeq1,Cost3);

% SERIES MERGE OF (8,6,5)&3
keq2=1:length(Diaeq2);
[PDeq3, Costeq3, Diaeq3]= SeriesMerge(keq2,k4,Diaeq2,D',PDeq2,PD4,Costeq2,Cost4);

% PARALLEL MERGE OF (8,6,5,3)&2
keq3=1:length(Diaeq3);
[PDeq4, Costeq4, Diaeq4]= ParallelMerge(keq3,k5,Diaeq3,D',PDeq3,PD5,Costeq3,Cost5);

% SERIES MERGE OF (8,6,5,3,2)&1
keq4=1:length(Diaeq4);
[PDeq5, Costeq5, Diaeq5]= SeriesMerge(keq4,k6,Diaeq4,D',PDeq4,PD6,Costeq4,Cost6);

%% CHECKING HEAD CONSTRAINTS OF FINAL OPTIONS

for i=1:length(PDeq5)
        Sol=i;
        OptDia=Diaeq5(Sol,:);
        OptPD=PDeq5(Sol);
        OptCost=Costeq5(Sol);
        
        H2=210-(162.9*1000*(Q(6)/130)^(1.85))/OptDia(6)^(4.87);
        H3=H2-(162.9*1000*(Q(5)/130)^(1.85))/OptDia(5)^(4.87);
        H4=H2-(162.9*1000*(Q(4)/130)^(1.85))/OptDia(4)^(4.87);
        H6=H4-(162.9*1000*(Q(3)/130)^(1.85))/OptDia(3)^(4.87);
        H7=H6-(162.9*1000*(Q(2)/130)^(1.85))/OptDia(2)^(4.87);
        H5=H7-(162.9*1000*(Q(1)/130)^(1.85))/OptDia(1)^(4.87);
      if(H6>=195 && H3>=190 && H4>=185 && H5>=180 && H7>= 190) % H2 is always satisfied if these are satisfied
            H2=H2
            H3=H3
            H4=H4
            H5=H5
         H6=H6
         H7=H7
          OptDia=OptDia
            OptCost=OptCost
            break;
        end
    
end
