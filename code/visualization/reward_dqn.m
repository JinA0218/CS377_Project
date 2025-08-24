clf;hold on;

% data = readtable('results/rewards_naive.csv');
data = readtable('results/rewards_wrapped.csv');
data_array = table2array(data);

rewards = data_array;
%rewards = data_array(:, 2)';
avg_rewards = movmean(rewards, [49 0]);

x = 1:length(rewards);
plot(x, rewards);
plot(x, avg_rewards);
legend(["Reward per episode" "Moving average (50)"], 'Location', 'southeast')

ylim([-900, 20]);
xlabel('epochs');ylabel('total reward');
title('Reward-shaped DQN reward plot (seed=2)');
% saveas(gcf, 'reward_plot.png');