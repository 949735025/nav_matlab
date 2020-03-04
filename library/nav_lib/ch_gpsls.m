% GPS α����С���˷���⣬ ״̬��Ϊ X Y Z B(�Ӳ�)

function x = ch_gpsls(x, sv_pos,  pr)

B1=1;
END_LOOP=100;
%���Ǹ���
n = size(sv_pos, 2);

if n < 4
    return
end
    
    while (END_LOOP > B1)
        % ��õ�ǰλ���������վ�ľ���
        r = vecnorm(sv_pos - x(1:3));
        
        % ���H����
        H = (sv_pos - x(1:3)) ./ r;
        H =-H';
        
        H = [H(:,1:3),  ones(n,1)];
        
        b = ((pr - r) - x(4))';
        
        % �����û�����
        delta =  (H'*H)^(-1)*H'*b;
        x = x + delta;
        
        END_LOOP = vnorm(delta(1:3));
    end%End of While
end


