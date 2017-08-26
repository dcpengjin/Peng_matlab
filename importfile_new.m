function data = importfile_new(workbookFile, sheetName, range)
%IMPORTFILE1 ������ӱ���е�����
%   DATA = IMPORTFILE1(FILE) ��ȡ��Ϊ FILE �� Microsoft Excel
%   ���ӱ���ļ��ĵ�һ�Ź������е�������ֵ���ݲ�������Щ���ݡ�
%
%   DATA = IMPORTFILE1(FILE,SHEET) ��ָ���Ĺ������ж�ȡ��
%
%   DATA = IMPORTFILE1(FILE,SHEET,RANGE) ��ָ���Ĺ������ָ���ķ�Χ�ж�ȡ��ʹ���﷨ 'C1:C2'
%   ָ����Χ������ C1 �� C2 ������ĶԽǡ�
%
%	���ų���������ֵԪ�����С�
%
% ʾ��:
%   datanew = importfile1('datanew.xlsx','1','Q4:T258');
%
%   ������� XLSREAD��

% �� MATLAB �Զ������� 2017/08/06 18:50:43

%% ���봦��

% ���δָ���������򽫶�ȡ��һ�Ź�����
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% ���δָ����Χ���򽫶�ȡ��������
if nargin <= 2 || isempty(range)
    range = '';
end

%% ��������
[~, ~, raw] = xlsread(workbookFile, sheetName, range);

%% �ų����з���ֵԪ������
I = ~all(cellfun(@(x) (isnumeric(x) || islogical(x)) && ~isnan(x),raw),2); % ���Ҿ��з���ֵԪ������
raw(I,:) = [];

%% �����������
J = cellfun(@(x) ischar(x), raw);
raw(J) = {NaN};
data = reshape([raw{:}],size(raw));

