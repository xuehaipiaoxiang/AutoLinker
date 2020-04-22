
function borderDistMat=Step2_Dist_to_b(data,border_point_set)
[M,N]=size(data);
num_border_point=2^N;
borderDistMat=zeros(num_border_point,M);
for i=1:num_border_point
    repBorderM=repmat(border_point_set(i,:),M,1);
    borderDistMat(i,:)=sqrt(sum((data-repBorderM).^2,2))';
end





