data = readtable('results/Linear_VRAIL_weights/weights_total.csv');
data_array = table2array(data);

mean_array = mean(data_array, 1);
std_array = std(data_array, 0, 1);

% 중간에 NaN 삽입해서 시각적 여백 만들기
% (NaN은 bar에서 표시되지 않음)
mean_gap = [
    mean_array(1:5), NaN, ...
    mean_array(6:10), NaN, ...
    mean_array(11:15), NaN, ...
    mean_array(16:19)
];
std_gap = [
    std_array(1:5), NaN, ...
    std_array(6:10), NaN, ...
    std_array(11:15), NaN, ...
    std_array(16:19)
];

x = 1:length(mean_gap);

% 막대 그래프 그리기
errorbar(x, mean_gap, std_gap, 'o', 'LineWidth', 1.5);

xlabel('State component');
ylabel('Weight');
title('Weights visualization (Average)');

% x축 눈금 설정 (optional)
xticks(1:length(mean_gap));
xticklabels({...
    'row: 0','1','2','3','4', '', ...
    'col: 0','1','2','3','4', '', ...
    'P: R','G','Y','B','T', '', ...
    'D: R', 'G', 'Y', 'B'
});
grid on;
%saveas(gcf, 'weight.png');