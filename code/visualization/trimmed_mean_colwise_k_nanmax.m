function m = trimmed_mean_colwise_k_nanmax(X, k)
% 각 열에서 최댓값 k개, 최솟값 k개 제거 후 평균 계산
% NaN은 최댓값(inf)으로 간주해서 제거 대상에 포함됨
% 입력: X (m x n), k (정수)
% 출력: m (1 x n) 벡터 (각 열의 trimmed mean)

    [~, n_cols] = size(X);
    m = zeros(1, n_cols);

    for j = 1:n_cols
        col = X(:, j);
        col(isnan(col)) = inf;  % NaN → inf로 취급 (최댓값 역할)

        sorted = sort(col);  % 오름차순 정렬

        % 유효값 개수 (NaN 제외)
        valid = sorted(sorted < inf);

        if numel(valid) > 2 * k
            trimmed = sorted((k+1):(end-k));
        else
            trimmed = valid;  % 유효값 부족 시 전체 평균
        end

        m(j) = mean(trimmed);
    end
end