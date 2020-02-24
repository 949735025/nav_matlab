%%
% anchor_pos: anchor pos:  3xN (N�ǻ�վ����)
% p �û�λ��
% pr α��

function p = ch_triangulate(anchor_pos, p,  pr)

% ��վ����
n = size(anchor_pos, 2);

% ��ǰ���Ƶĵ�������վ�ľ���
r = vecnorm(anchor_pos - p);

% ���㼸�ξ���
H = (anchor_pos - p) ./ r;
H =-H';

% ����λ��
p =  p + (H'*H)^(-1)*H'*(pr - r)';
end


