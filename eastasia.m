%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: Admixture data (Harbin han) 0831.xlsx
%    Worksheet: 1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/09/18 20:50:41

%% Import the data
[~, ~, AdmixturedataHarbinhan08310_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N4:Q16');
[~, ~, AdmixturedataHarbinhan08311_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N20:Q44');
[~, ~, AdmixturedataHarbinhan08312_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N48:Q64');
[~, ~, AdmixturedataHarbinhan08313_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N68:Q79');
[~, ~, AdmixturedataHarbinhan08314_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N83:Q95');
[~, ~, AdmixturedataHarbinhan08315_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N99:Q109');
[~, ~, AdmixturedataHarbinhan08316_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N113:Q123');
[~, ~, AdmixturedataHarbinhan08317_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N127:Q140');
[~, ~, AdmixturedataHarbinhan08318_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N144:Q164');
[~, ~, AdmixturedataHarbinhan08319_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N168:Q183');
[~, ~, AdmixturedataHarbinhan083110_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N187:Q212');
[~, ~, AdmixturedataHarbinhan083111_0] = xlsread('Admixture data (Harbin han) 0831.xlsx','1','N216:Q243');
eastasia1 = [AdmixturedataHarbinhan08310_0;AdmixturedataHarbinhan08311_0;AdmixturedataHarbinhan08312_0;AdmixturedataHarbinhan08313_0;AdmixturedataHarbinhan08314_0;AdmixturedataHarbinhan08315_0;AdmixturedataHarbinhan08316_0;AdmixturedataHarbinhan08317_0;AdmixturedataHarbinhan08318_0;AdmixturedataHarbinhan08319_0;AdmixturedataHarbinhan083110_0;AdmixturedataHarbinhan083111_0;];
eastasia1(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),eastasia1)) = {''};

%% Clear temporary variables
clearvars AdmixturedataHarbinhan08310_0 AdmixturedataHarbinhan08311_0 AdmixturedataHarbinhan08312_0 AdmixturedataHarbinhan08313_0 AdmixturedataHarbinhan08314_0 AdmixturedataHarbinhan08315_0 AdmixturedataHarbinhan08316_0 AdmixturedataHarbinhan08317_0 AdmixturedataHarbinhan08318_0 AdmixturedataHarbinhan08319_0 AdmixturedataHarbinhan083110_0 AdmixturedataHarbinhan083111_0;