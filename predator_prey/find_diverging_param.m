%% このプログラムの説明
% 目的：
% 種間競争システムにおいて，ネットワーク構造を固定したときに，解軌道が
% 振動的になるパラメータを探すことです．
% 3種，4種で探したが，見つからなかったので，6種を試しました．
% 得られた振動パラメータは同じディレクトリの"simulate_predator_prey"で
% 用いられています．

clear
close all 

tmax = 10;
t = [0;
     tmax];
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
tmax2 = tmax*2;


%% 3種で探索
% x_0 = ones(3,1);
% while(1)
%     a = -0.001*rand(3,1);
%     b = 100*rand(3,1);
% 
%     A = [a(1) -b(1) 0;
%         -0 a(2) -b(2);
%         -b(3) 0 a(3)];
% 
%     r  = 0.1*[randn;
%           randn;
%           10*rand];
% 
%     sys = @(t,x)predator_prey(t,x,A,r);
%     [t,x] = ode45(sys,t,x_0,options);
% 
%     if var(x(length(x)-10:length(x))) > 1e-02
%         tmax = 1000;
%         t = [0,tmax];
%         [t,x] = ode45(sys,t,x_0,options);
%         break
%     end
% end

 
%% 4種で探索
% x_0 = ones(4,1);
% while(1)
%     a = -0.001*rand(4,1);
%     b = 10*rand(4,1);
%     b2 = 10*rand(4,1);
%     b2 = b;
% 
%     A = [a(1) b(1) 0 0;
%         -b2(2) a(2) b(2) 0;
%         0 -b2(3) a(3) b(3);
%         0 0 -b2(4) a(4)];
% 
%     r  = 0.1*[randn;
%           randn;
%           randn;
%           10*rand];
% 
%     sys = @(t,x)predator_prey(t,x,A,r);
%     [t,x] = ode45(sys,t,x_0,options);
% 
%     if var(x(length(x)-10:length(x))) > 1e-06
%         tmax = 1000;
%         t = [0,tmax];
%         [t,x] = ode45(sys,t,x_0,options);
%         break
%     end
% end

%% 6種で探索
x_0 = ones(6,1);
while(1)
    a = -0.001*rand(6,1);
    b = 100*rand(9,1);

    A = [a(1) b(1) 0 -b(2) 0 0;
        0 a(2) b(3) 0 b(4) 0;
        -b(5) 0 a(3) 0 0 b(6);
        b(7) 0 0 a(4) 0 0;
        0 -b(8) 0 0 a(5) 0;
        0 0 -b(9) 0 0 a(6)];

    r  = 100*randn(6,1);

    sys = @(t,x)predator_prey(t,x,A,r);
    [t,x] = ode45(sys,t,x_0,options);
    
    % 定常応答時の分散が大きいことを「収束しない」条件とする
    var_sol = var(x(length(x)-10:length(x)))
    if var_sol > 1e-06 && var_sol < 1e10
        t = [0,tmax2];
        [t,x] = ode45(sys,t,x_0,options);
        break
    end
end

%% プロットして振動を確認
figure
plot(t,x)