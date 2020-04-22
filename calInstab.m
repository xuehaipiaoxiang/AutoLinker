function [instab] = calInstab(data,clusters,num_classes)


class_center=zeros(num_classes,2);
for i=1:num_classes
    
    num=clusters{i}.num;
    sum_point=0;
    for j=1:num
        k=clusters{i}.class{j};
        p=data(k,:);
        sum_point=p+sum_point;
    end
    class_center(i,:)=sum_point./num;
end
    instab=0;
    for i=2:num_classes
        instab=instab+sqrt(sum((class_center(1,:)-class_center(i,:)).^2,2));
    end
instab=(instab/num_classes^2).^(-1);
end

