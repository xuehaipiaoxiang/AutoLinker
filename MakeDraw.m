%根据样本数据P和标签L_P显示数据
%只画二维和三维的情况
%P的每一列为一个样本
function MakeDraw(data_,dataLabel,NeighborList)

[M,N]=size(data_);

colorList=['r' 'y' 'b' 'c' 'm' 'g','w'];
markerList=['o' '+' '*' '.' 'x' 's' 'd' '^' 'v','>','<','p','h'];
max_marker_num=length(markerList);
max_color_num=length(colorList);
LineWidth=1;
MarkerSize=6;


% ColorList=rand(M,3); %生成随机颜色列表
% increase_alpha=0.5;
% colorP=ColorList(i,:);

if N==2
    figure
    hold on
    for i=1:M
        paintP=data_(i,:);
        marker=markerList(mod(dataLabel(i),max_marker_num)+1);
        color=colorList(mod(dataLabel(i),max_color_num)+1);
        plot(paintP(1),paintP(2),marker,'MarkerEdgeColor',color, 'MarkerFaceColor',color, 'MarkerSize',MarkerSize,'LineWidth',LineWidth)
    end
    
    %    axis equal
    %    Max_X=max(P(1,:));
    %    Min_X=min(P(1,:));
    %    Max_Y=max(P(2,:));
    %    Min_Y=min(P(2,:));
    %    xlim([Min_X-abs(Min_X)*increase_alpha Max_X+abs(Max_X)*increase_alpha])
    %    ylim([Min_Y-abs(Min_Y)*increase_alpha Max_Y+abs(Max_Y)*increase_alpha])
    
    %    for i=1:N
    %       x=P(1,i)*(1+0.05);
    %       y=P(2,i)*(1+0.05);
    %       text(x,y,['p_' num2str(i)])
    %    end
    
    if nargin > 2
        %根据 NeighborList画链接
        num_border_point=size(NeighborList,1);
        for i=1:num_border_point
            for j=1:M
                if NeighborList(i,j)>0 %表示有效链接，且不是本身
                    begin_p=j;
                    end_p=NeighborList(i,j);
                    line([data_(begin_p,1),data_(end_p,1)]',[data_(begin_p,2),data_(end_p,2)]');
                end
            end
        end
    end
    
    
elseif N==3
    
    figure
    hold on
    for i=1:M
        paintP=data_(i,:);
        color=colorList(mod(dataLabel(i),max_color_num)+1);
        marker=markerList(mod(dataLabel(i),max_marker_num)+1);
        plot3(paintP(1),paintP(2),paintP(3),marker,'MarkerEdgeColor',color, 'MarkerFaceColor',color, 'MarkerSize',MarkerSize,'LineWidth',LineWidth)
    end
    
    %    axis equal
    %     az=36;
    %     el=36;
    %     view([az, el])
    %     Max_X=max(P(1,:));
    %    Min_X=min(P(1,:));
    %    Max_Y=max(P(2,:));
    %    Min_Y=min(P(2,:));
    %    Max_Z=max(P(3,:));
    %    Min_Z=min(P(3,:));
    %    xlim([Min_X-abs(Min_X)*increase_alpha Max_X+abs(Max_X)*increase_alpha])
    %    ylim([Min_Y-abs(Min_Y)*increase_alpha Max_Y+abs(Max_Y)*increase_alpha])
    %    zlim([Min_Z-abs(Min_Z)*increase_alpha Max_Z+abs(Max_Z)*increase_alpha])
    %    for i=1:N
    %       x=P(1,i)*(1+0.05);
    %       y=P(2,i)*(1+0.05);
    %       z=P(3,i)*(1+0.05);
    %       text(x,y,z,['p_' num2str(i)])
    %    end
    
    
    
    
    if nargin > 2
        %根据 NeighborList画链接
        num_border_point=size(NeighborList,1);
        for i=1:num_border_point
            for j=1:M
                if NeighborList(i,j)>0 %表示有效链接，且不是本身
                    begin_p=j;
                    end_p=NeighborList(i,j);
                    line([data_(begin_p,1),data_(end_p,1)]',[data_(begin_p,2),data_(end_p,2)]',[data_(begin_p,3),data_(end_p,3)]');
                end
            end
        end
    end
    
end
end

