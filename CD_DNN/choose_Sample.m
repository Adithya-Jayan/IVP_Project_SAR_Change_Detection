function [ check] = choose_Sample(changed_map)
%%����Ϊchange_mapͼ��
%%�����change_map��С��ͬ��check���������ǰcheckֵΪ255����Ϊ���õ㣬���Ϊ0����Ϊ�����õ㡣���Ϊ125����Ϊ��ѡ�㣨����Ϊ�߽�㣩��  

%test
n=3;%�����С
alph=0.5;

[rows cols]=size(changed_map);
check=zeros(rows,cols);
check=changed_map;

for i=3:rows-2
    for j=3:cols-2
        count=0;
        for ii=-(n-1)/2:(n-1)/2
            for jj=-(n-1)/2:(n-1)/2
                if(changed_map(i+ii,j+jj)==changed_map(i,j))
                    count=count+1;
                end
            end
        end
        if(count/(n*n)>(alph*1.5))
            check(i,j)=255;
        
        else if(count/(n*n)>alph)
            check(i,j)=125;
            else
            check(i,j)=0;
        end
    end
end




end

