
function [clusters,num_classes]=mergeR(NeighborList)

num_classes=0;
old_num_classes=-1;
[num_border_point,N]=size(NeighborList);
%clusters{1}.OneClass{1}.label=1;%第一个点属于第一类
%clusters{1}.OneClass{1}.index=1;%第一个点

clusters{1}.num=0;
%clusters{1}.class{1}=0;

while num_classes~=old_num_classes
    old_num_classes=num_classes;
for each=1:num_border_point
    for j=1:N
        i=NeighborList(each,j);
        if i>0
            [ei,ej]=exist_in_cluster(i,j,clusters,num_classes);
            if ei||ej
                if ei&&ej % case 1 merge
                    if ei==ej
                        continue
                    end
                    num_classes=num_classes-1;
                    clusters{ei}.num=clusters{ei}.num+clusters{ej}.num;
                    clusters{ei}.class={clusters{ei}.class{:},clusters{ej}.class{:}};
                    clusters(ej)=[];% remove cluster j
                    
                elseif ei>0 % case 2 link-j
                    clusters{ei}.num=clusters{ei}.num+1;
                    clusters{ei}.class{clusters{ei}.num}=j;
                elseif ej>0 % case 2 link-i
                    clusters{ej}.num=clusters{ej}.num+1;
                    clusters{ej}.class{clusters{ej}.num}=i;
                end
            else % case 3 neither
                num_classes=num_classes+1;
                clusters{num_classes}.num=2;
                clusters{num_classes}.class{1}=i;
                clusters{num_classes}.class{2}=j;
            end
            
        end
    end
end
end
%%display
% for i=1:num_classes
%     disp(['=========Class: ',num2str(i)])
%     num=clusters{i}.num;
%     for j=1:num
%         index=clusters{i}.class{j};
%         disp(['index: ',num2str(index)])
%     end
% end
end

    


