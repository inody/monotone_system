function dx = gene_regulatory(t,x,param,adjacent)
%% このプログラムの説明
% 目的：
% 遺伝子制御システムの動特性を計算します．
% サブシステムのパラメータとネットワーク構造を受け取り，現在の状態xから
% 時間微分dx/dtを計算します．

    a = param(:,1);
    beta = param(:,2);
    c = param(:,3);
    b = param(:,4);
    mu = param(:,5);
    pm = param(:,6);
    num_sys = length(adjacent);
    
    p = zeros(num_sys,1);
    for i = 1:num_sys
        p(i) = x(2*i);
    end
    p_sum = adjacent*p;
    
    
    hill = zeros(num_sys,1);
    for i = 1:num_sys
        if pm(i) > 0
            hill(i) = p_sum(i)^mu(i)/(1+p_sum(i)^mu(i));
        else 
            hill(i) = 1/(1+p_sum(i)^mu(i));
        end
    end
    u = zeros(2*num_sys,1);   
    for i = 1:num_sys
        u(2*i-1) = hill(i);
    end

    for i = 1:num_sys
        A_i = [-a(i) 0; 
            c(i) -b(i)];
        if i == 1
            A = A_i;
        else
            A = blkdiag(A,A_i);
        end
    end 

    for i = 1:num_sys
        if i == 1
            B = blkdiag(beta(i),0);
        else
            B = blkdiag(B,beta(i),0);
        end
    end 

    dx = A*x + B*u;
end