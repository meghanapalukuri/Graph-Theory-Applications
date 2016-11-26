function [PressureDropFinal, CostFinal, DiaFinal]= ParallelMerge(k1,k2,D1,D2,PD1,PD2,Cost1,Cost2)
i=1;
j=1;
count=1;
while (i<=length(k1) && j<=length(k2))
    if(PD1(i)>PD2(j))
        PDed(count)=PD1(i);
        ind=1;
    else
        PDed(count)=PD2(j);
        ind=2;
    end
        CostSer(count)=Cost1(i)+Cost2(j);
         Dia(count,:)=[D1(i,:),D2(j,:)];
         if(ind==1)
             i=i+1;
         else
             j=j+1;
         end
         count=count+1;
        
end
PressureDropFinal=PDed';
CostFinal=CostSer';
DiaFinal=Dia;
end