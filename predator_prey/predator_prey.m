function dx = predator_prey(t,x,A,r)
%% ���̃v���O�����̐���
% �ړI�F
% ��ԋ����V�X�e���̓�������\���֐��ł��D
% �e�T�u�V�X�e���̃p�����[�^�ł���A��r���󂯎���āC���݂̏��x���玞�Ԕ���dx/dt
% ���v�Z���܂��D

%     x = max(x,eps);
    dx = diag(x) * ( A*x + r );
end