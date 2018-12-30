function dx = predator_prey(t,x,A,r)
%% このプログラムの説明
% 目的：
% 種間競争システムの動特性を表す関数です．
% 各サブシステムのパラメータであるAとrを受け取って，現在の状態xから時間微分dx/dt
% を計算します．

%     x = max(x,eps);
    dx = diag(x) * ( A*x + r );
end