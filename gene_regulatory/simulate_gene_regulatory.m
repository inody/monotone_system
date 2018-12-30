%% ���̃v���O�����̐���
% �ړI�F
% ��`�q����V�X�e���̓��������v�Z���܂��D
% �T�u�V�X�e���̃p�����[�^�ƃl�b�g���[�N�\�����󂯎��C���݂̏��x����
% ���Ԕ���dx/dt���v�Z���܂��D

clear
close all
u = 0;

%% �p�����[�^�ݒ�
% �T�u�V�X�e���̃p�����[�^�Fa_i,b_i,c_i,beta_i,mu_i, ���ior�}��

% % 2�̃T�u�V�X�e���C��O���t
% % �����p�����[�^
% param = [1,1,1,1.2,3,1;
%          1,1,1,1.2,3,-1];
% % �U���p�����[�^
% param = [1,1,5,1,3,1;
%          1,1,5,1,3,-1];
% 
% % �אڍs��
% adjacent = [0 1;
%             1 0];
        
% 5�̃T�u�V�X�e���C�Ԍ^�O���t
% �����p�����[�^
param = [1 1 1 0.6 3 -1;
    1 1 1 1.2 3 1;
    1 1 1 1.2 3 1;
    1 1 1 1.2 3 1;
    1 1 1 1.2 3 1;]
% �U���p�����[�^
param = [1 1 1.5 1 3 -1;
    1 1 2.5 1.2 3 1;
    1 1 2.5 1.2 3 1;
    1 1 2.5 1.2 3 1;
    1 1 2.5 1.2 3 1];

adjacent = [0 0 1 0 1;
    1 0 0 0 0;
    0 1 0 0 0;
    1 0 0 0 0;
    0 0 0 1 0];

num_sys = length(adjacent);


%% �V�~�����[�V����
T = 50;
t = [0,T];
options = odeset('RelTol',1e-8,'AbsTol',1e-8);
sys = @(t,x)gene_regulatory(t,x,param,adjacent);

x_0 = 2*rand(2*num_sys,1);
[t,x] = ode45(sys,t,x_0,options);

figure
plot(t,x)