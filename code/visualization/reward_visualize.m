hold off;clf;clear;hold on;

thresholds = [-10, -5, 0, 5];  % 여러 threshold 값
idxs_mat = [];

for i=0:9
data = readtable(sprintf('results/quad_VRAIL/rewards_seed%d.csv', i));
data_array = table2array(data);

%rewards = data_array;
rewards = data_array(:, 2)'; % For different structure of quad VRAIL
avg_rewards = movmean(rewards, [49 0]);

x = 1:length(rewards);
%plot(x, rewards);
plot(x, avg_rewards);
%legend(["Reward per episode" "Moving average (50)"], 'Location', 'southeast')

% To get when we achieve the threshold
idxs = zeros(size(thresholds));

for j = 1:length(thresholds)
    idx = find(avg_rewards > thresholds(j), 1, 'first');
    if isempty(idx)
        idxs(j) = NaN;  % NaN is None
    else
        idxs(j) = idx;
    end
end
idxs_mat = [idxs_mat; idxs];
end

ylim([-900, 20]);
xlabel('epochs');ylabel('total reward');
% title('DQN (without wall) reward plot');
legend("seed "+(0:9), 'Location', 'southeast');
saveas(gcf, 'reward_plot.png');