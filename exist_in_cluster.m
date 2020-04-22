function [ei,ej]=exist_in_cluster(findI,findJ,clusters,num_classes)

ei=0;
ej=0;
if num_classes==0
    return;
end
for i=1:num_classes
    num=clusters{i}.num;
    for j=1:num
        if clusters{i}.class{j}==findI
            ei=i;
        end
        if clusters{i}.class{j}==findJ
            ej=i;
        end
        
    end
end
end

