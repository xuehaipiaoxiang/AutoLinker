
function [NeighborList,NeighborDist]=Step4_Find_Closest(data,borderDistIndex)

[M,N]=size(data);
num_border_point=2^N; %even number of 2
NeighborList=zeros(num_border_point,M);
NeighborDist=zeros(num_border_point,M);

for i=1:num_border_point
    j=num_border_point-i+1; %对角边界点下标
    for k=1:M
        posAtI=find(borderDistIndex(i,:)==k);
        posAtJ=find(borderDistIndex(j,:)==k);
        if posAtI>posAtJ % be sure posAtI less than posAtJ
            tmp=posAtI;
            posAtI=posAtJ;
            posAtJ=tmp;
        end
        if posAtI==1 || posAtJ==N %CASE 1
            idx=-1;
            dist=0;
        elseif posAtJ-posAtI<=1 %CASE 2 
            searchId1=borderDistIndex(i,posAtI-1);
            searchId2=borderDistIndex(i,posAtJ+1);
            dist1=sqrt(sum((data(searchId1,:)-data(k,:)).^2));
            dist2=sqrt(sum((data(searchId2,:)-data(k,:)).^2));
            if dist1<dist2
                idx=searchId1;
                dist=dist1;
            else
                idx=searchId2;
                dist=dist2;
            end
        else  % CASE 3 find the closest point
            pointRep=repmat(data(k,:),posAtJ-posAtI-1,1);
            searchIdx=borderDistIndex(i,posAtI+1:posAtJ-1);
            searchD=data(searchIdx,:);
            distVec=sqrt(sum((pointRep-searchD).^2,2));
            [dist,I] = min(distVec);
            idx=searchIdx(I);
        end
        NeighborList(i,k)=idx; %return the index before sorting
        NeighborDist(i,k)=dist;
    end
end















