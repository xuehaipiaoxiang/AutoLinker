
function [instab]=clustering_framework(inputData,w,flag)


disp('Step 1')
[data,border_point_set]=Step1_GetBoundaries(inputData);

%MakeDraw(data,dataLabel)

disp('Step 2')
borderDistMat=Step2_Dist_to_b(data,border_point_set);% size=[N^2,M]

disp('Step 3') % borderDistIndex::= sorted points to each borderPoint
borderDistIndex=Step3_SortDistance(borderDistMat); 


% NeighborList size=[borderPoint,N]
% NeighborDist size=[borderPoint,N]
disp('Step 4')
[NeighborList,NeighborDist]=Step4_Find_Closest(data,borderDistIndex);
%MakeDraw(data,dataLabel,NeighborList)%画链接

% Step 5,:根据链表计算有点的平均距离
disp('Step 5')
NeighborList=Step5_Cut_Lines(NeighborList,NeighborDist,w(1),w(2)); % bigger  less cut
%MakeDraw(data,dataLabel,NeighborList)%画链接

disp('Step 6')
%根据NeighborList矩阵得出聚类结果
[clusters,num_classes]=mergeR(NeighborList);
disp('Step 7')

instab=calInstab(data,clusters,num_classes);
if flag~=0
    newDraw(data,clusters,num_classes);
end






