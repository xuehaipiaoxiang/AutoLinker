function   clusterPkg(NeighborList)

% 使用尾递归
clusters{1}.OneClass{1}.label=1;%第一个点属于第一类
clusters{1}.OneClass{1}.index=1;%第一个点

merge()

% display
for i=1:num_class
        num=max(size(clusters{i}.OneClass));
        for j=1:num
            disp(['index=' num2str(clusters{i}.OneClass{j}.index) '  label=' num2str(clusters{i}.OneClass{j}.label)])

        end
end
end

