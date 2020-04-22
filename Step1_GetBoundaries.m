function [data,border_point_set]=Step1_GetBoundaries(rowData)

%M is the observations of rowData
%N is the variables  of rowData

[M,N]=size(rowData);
dataLabel=rowData(:,N);
%N=N-1;
%data=rowData(:,1:N);
data=rowData;

MinMaxMat=[min(data)',max(data)']; % size [N,2]
MinMaxMatCast=zeros(N,2);

num_border_point=2^N;
border_point_set=zeros(N,num_border_point);
for i=0:num_border_point-1
   charArray=dec2bin(i,N);
   binaryVec=str2num(strread(charArray,'%c'));
   MinMaxMatCast(:,1)=binaryVec;
   MinMaxMatCast(:,2)=1-binaryVec;
   border_point_set(:,i+1)=sum(MinMaxMatCast.*MinMaxMat,2);
end
border_point_set=border_point_set';