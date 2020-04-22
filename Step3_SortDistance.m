
function [borderDistIndex]=Step3_SortDistance(borderDistMat)

[M,N]=size(borderDistMat);%size=[num_border_point,m]

%perpare allocate
borderDistIndex=repmat([1:N],M,1); % we only use borderDistMat'index
bMatSort=borderDistMat;

for k=1:M % for_each borderPoint k
    i=1;
    while(i<N) % select_Sorting
        minV=bMatSort(k,i);
        minIdx=i;
        for j=N:-1:i
            if bMatSort(k,j)<minV
                minV=bMatSort(k,j);
                minIdx=j;
            end
        end
        %swap begin
        bMatSort(k,minIdx)=bMatSort(k,i);
        bMatSort(k,i)=minV;
        
        tmp=borderDistIndex(k,minIdx);
        borderDistIndex(k,minIdx)=borderDistIndex(k,i);
        borderDistIndex(k,i)=tmp;
        %swap end
        i=i+1;
    end
end









