%% 第四步：计算与最大值的距离和最小值的距离，并算出得分
data=xlsread('副本附件用于SPSS分析正向化后','Sheet1','F2:H390')
[n,m] = size(data)
D_P = sum([(data - repmat(max(data),n,1)) .^ 2 ],2) .^ 0.5;   % D+ 与最大值的距离向量
D_N = sum([(data - repmat(min(data),n,1)) .^ 2 ],2) .^ 0.5;   % D- 与最小值的距离向量
S = D_N ./ (D_P+D_N);    % 未归一化的得分
disp('最后的得分为：')
stand_S = S / sum(S)
[sorted_S,index] = sort(stand_S ,'descend');