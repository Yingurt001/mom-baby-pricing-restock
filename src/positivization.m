clear;clc
%导入数据 
data = xlsread('附件.xlsx')%附件已经经过数据预处理，去除了异常值，删除了后二十组空白的数据并将字符串转化为逻辑变量，安静型为1，中等型为2，矛盾型为3
[n,m] = size(data)
data_2 = data
%正向化处理，对于EPDS、HADS、CBTS三组数据，是极小型数据，需要进行正向化变为极大型数据。
Positivicolumn = [6,7,8];
for i = 1 : size(Positivicolumn,2)        
data(:,Positivicolumn(i)) = Min2Max(data(:,Positivicolumn(i)));
end
disp(data)
%使用Min-Max标准化处理形成新矩阵，需要标准化的为连续性变量，即母亲年龄（1），妊娠时间（4），CBTS（6），EPDS（7），HADS(8),婴儿年龄（10），整晚睡眠（11），睡醒次数（12）
Positivicolumnn = [1,4,6,7,8,11,12];
for i = 1 : size(Positivicolumnn,2)        
data(:,Positivicolumnn(i)) = (data(:,Positivicolumnn(i)) - min(data(:,Positivicolumnn(i))))/(max(data(:,Positivicolumnn(i)))-min(data(:,Positivicolumnn(i))))
end
disp('为我们所得的标准化矩阵为')
disp(data)

%输出到新的excel表格
% 指定要保存的文件名和工作表名
filename = '附件output.csv';


% 使用xlswrite函数将矩阵写入Excel可读取的csv文件
csvwrite('附件output.csv', data);