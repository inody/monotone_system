%% ���̃v���O�����̐���
% �ړI�F
% ��ԋ����V�X�e�����V�~�����[�V�������邱�Ƃł��D
% �C�m�_���̒藝�𖞂����p�����[�^�ƁC�����łȂ��p�����[�^��p����
% �V�~�����[�V�������C�O�҂ł͋O���������C��҂ł͐U�����邷�邱�Ƃ��v���b�g
% ���܂��D
% 

clear
close all

% �U���p�����[�^
A = [ -0.001,    10,     0,     -10,     0,     0;
           0,  -0.5,     1,       0,     1,     0;
          -1,     0,  -0.1,       0,     0,     1;
           4,     0,     0,  -0.005,     0,     0;
           0,    -1,     0,       0,  -0.5,     0;
           0,     0,    -1,       0,     0, -0.01];

% �����p�����[�^
A = [-20.1, 10,  0, -10,  0,  0;
       0, -2.1,  1,   0,  1,  0;
      -1,  0, -2.1,   0,  0,  1;
       4,  0,  0,  -4.1,  0,  0;
       0, -1,  0,   0, -1.1,  0;
       0,  0, -1,   0,  0, -1.1];

% ���ʃp�����[�^
r = 1*[5;-1;1;-10;1;0.1];


x_0 = ones(6,1);
tmax = 40;
t = [0;
     tmax];
 
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
sys = @(t,x)predator_prey(t,x,A,r);
[t,x] = ode45(sys,t,x_0,options);

figure
plot(t,x)
legend('x_1','x_2','x_3','x_4','x_5','x_6')