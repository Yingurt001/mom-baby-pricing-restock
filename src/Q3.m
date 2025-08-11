clear;clc;
%多分类逻辑回归预测模型matlab代码部分
%使用matlab内置函数mnrfit 和 mnrval
% 假设训练集数据为X_train和y_train
% X_train是训练集的自变量，即母亲的身体特征和心理特征数据
% y_train是训练集的因变量，即婴儿的行为特征
% X_test是测试集的自变量，即母亲的身体特征和心理特征数据
% y_test是测试集的因变量，即婴儿的行为特征，1为矛盾，2为中等，3为安静
%在进行训练时，发现婴儿三个行为特征的占比并不均衡，中等型占据大多数，
% 这会影响逻辑回归预测模型的准确性，
% 故我们可以通过重采样和欠采样（随机删除占比较多的类别样本和复制占比较少的类别样本）来平衡训练集中的类别比例。
data = xlsread('原数据_1.xlsx')
X_train = data(1:250, 1: 8); 
y_train = data(1:250,14);
% 使用mnrfit内嵌函数训练多分类逻辑回归模型
model = mnrfit(X_train, y_train);
X_test = data(251:end,1: 8)
y_test = data(251:end,14) %X_test与y_test是训练集，即200个测试集
% 输出预测测试集的类别
predicted_test_labels = mnrval(model, X_test);
[~, predicted_test_labels] = max(predicted_test_labels, [], 2);
% 输出测试集的类别与实际类别比较，得到准确率
accuracy = sum(predicted_test_labels == y_test) / numel(y_test);
%导入缺失的二十组婴儿数据
res1 = xlsread('分界线检验.xlsx')
X_baby = res1(1:end, 1: 5);
f=@(a)870.67*a+200;
g=@(b)695*b+500;
h=@(c)2440*c+300;
% 初始化数据
data = [15, 22, 18];
alldata = [];
% 穷举法
for i = data(1):-1:0
for j = data(2):-1:0
for k = data(3):-1:0
alldata = [alldata; i, j, k];
end
end
end
for s=1:1:6992
alldata(s,1)=(21-alldata(s,1))/21;
alldata(s,2)=(28-alldata(s,2))/28;
alldata(s,3)=(20-alldata(s,3))/20;
end
result=[];
p=0;

X_baby(1:6992,6:8)=alldata(1:6992,1:3)

% 预测挖空数据的类别

predicted_missing_labels = mnrval(model, X_baby);
[~, predicted_missing_labels] = max(predicted_missing_labels, [], 2);
for q = 1:1:6992
if predicted_missing_labels(q,1)==2
p=p+1;
result(p,1:5)=[2,21-21*alldata(q,1),28-28*alldata(q,2),20-20*alldata(q,3),f(-6+21*alldata(q,1))+g(-6+28*alldata(q,2))+h(-2+20*alldata(q,3))];
elseif predicted_missing_labels(q,1 )==3
p=p+1;
result(p,1:5)=[3,21-21*alldata(q,1),28-28*alldata(q,2),20-20*alldata(q,3),f(-6+21*alldata(q,1))+g(-6+28*alldata(q,2))+h(-2+20*alldata(q,3))];
else
    p=p+1;
result(p,1:5)=[1,21-21*alldata(q,1),28-28*alldata(q,2),20-20*alldata(q,3),f(-6+21*alldata(q,1))+g(-6+28*alldata(q,2))+h(-2+20*alldata(q,3))];
end

end
T = array2table(result)