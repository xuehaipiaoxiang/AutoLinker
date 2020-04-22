
function NeighborList=Step5_Cut_Lines(NeighborList,NeighborDist,threshold,cutValue)

if nargin==2
    threshold=1;
    cutValue=2;
end

[num_border,N]=size(NeighborList);
[row,col] = find(NeighborList>0);
meanMat=zeros(num_border,N);
for i=1:length(row)
    meanMat(row(i),col(i))=NeighborDist(row(i),col(i));
end
meanToP=mean(meanMat,1); % caculate mean-value to each borderPoint
for i=1:N
    NeighborList(find(NeighborDist(:,i)>meanToP(i)*threshold),i)=0; %cut line which longer than mean-value
end

meanVa=mean(mean(NeighborDist),2);
for i=1:N
    NeighborList(find(NeighborDist(:,i)>meanVa*cutValue),i)=0; %cut line which longer than mean-value
end












