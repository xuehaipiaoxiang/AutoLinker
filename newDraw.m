function newDraw(data,clusters,num_classes)


colorList=['r' 'g' 'b' 'c' 'm' 'y','w'];
markerList=['o' '+' '*' '.' 'x' 's' 'd' '^' 'v','>','<','p','h'];
MarkerSize=6;
max_marker_num=length(markerList);
max_color_num=length(colorList);

figure
hold on
for i=1:num_classes
        marker=markerList(mod(i,max_marker_num)+1);
        color=colorList(mod(i,max_color_num)+1);
        num=clusters{i}.num;
        for j=1:num
         k=clusters{i}.class{j};
         p=data(k,:);
         scatter(p(1),p(2),marker,'MarkerEdgeColor',color, 'MarkerFaceColor',color)
    
        end
end

