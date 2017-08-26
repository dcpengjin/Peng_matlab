function data = importfile_new(workbookFile, sheetName, range)
%IMPORTFILE1 导入电子表格中的数据
%   DATA = IMPORTFILE1(FILE) 读取名为 FILE 的 Microsoft Excel
%   电子表格文件的第一张工作表中的所有数值数据并返回这些数据。
%
%   DATA = IMPORTFILE1(FILE,SHEET) 从指定的工作表中读取。
%
%   DATA = IMPORTFILE1(FILE,SHEET,RANGE) 从指定的工作表和指定的范围中读取。使用语法 'C1:C2'
%   指定范围，其中 C1 和 C2 是区域的对角。
%
%	已排除包含非数值元胞的行。
%
% 示例:
%   datanew = importfile1('datanew.xlsx','1','Q4:T258');
%
%   另请参阅 XLSREAD。

% 由 MATLAB 自动生成于 2017/08/06 18:50:43

%% 输入处理

% 如果未指定工作表，则将读取第一张工作表
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% 如果未指定范围，则将读取所有数据
if nargin <= 2 || isempty(range)
    range = '';
end

%% 导入数据
[~, ~, raw] = xlsread(workbookFile, sheetName, range);

%% 排除具有非数值元胞的行
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % 查找具有非数值元胞的行
raw(I,:) = [];

%% 创建输出变量
J = cellfun(@(x) ischar(x), raw);
raw(J) = {NaN};
data = reshape([raw{:}],size(raw));

