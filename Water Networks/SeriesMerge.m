function [PressureDropFinal, CostFinal, DiaFinal]= SeriesMerge(k1,k2,D1,D2,PD1,PD2,Cost1,Cost2)
count=1;
for i=1:length(k1)
    for j=1:length(k2)
        Dia(count,:)=[D1(i,:),D2(j,:)];
        PDSer(count)=PD1(i)+PD2(j);
        CostSer(count)=Cost1(i)+Cost2(j);
        count=count+1;
    end
end
[PDord,PDind]=sort(PDSer','descend');
PDNew(1)=PDord(1);
CostNew(1)=CostSer(PDind(1));
DiaNew=Dia(PDind(1),:);
counter=2;

for i=1:length(PDind)
    Costord(i)=CostSer(PDind(i)); % Arranging cost
    if(i~=1)
        if(Costord(i)>CostNew(counter-1)) 
                   PDNew(counter)=PDord(i);
CostNew(counter)=CostSer(PDind(i));
DiaNew(counter,:)=Dia(PDind(i),:);
counter=counter+1;
        else % Delete i-1
            for l=counter-1:-1:1
                 if(Costord(i)<=CostNew(l)) 
     PDNew(l)=PDord(i);                                                                                                                                         
CostNew(l)=CostSer(PDind(i));
DiaNew(l,:)=Dia(PDind(i),:);
counter=l+1;
                 end
            end
        end
    end
end

PressureDropFinal=PDNew';
CostFinal=CostNew';
DiaFinal=DiaNew;
end