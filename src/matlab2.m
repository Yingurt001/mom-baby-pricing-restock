clear;clc
load matlab1.mat  %文件名如果有空格
%使用斯皮尔曼相关系数去求母亲身体状况、心理状况和孩子行为特征睡眠状况的关系
%第一步：导入excel中数据，母亲年龄为X，婴儿行为特征为Y.
% 直接给出相关系数和p值
R = corrcoef(matlab)   % correlation coefficient
% [R,P] = corr(matlab, 'type' , 'Spearman')