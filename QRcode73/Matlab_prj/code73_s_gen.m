
s = zeros(36,1);

s0 = 25023207797;

s(1,1) = bitshift(s0,1);

if(s(1,1) > 68719476735)
    s(1,1) = bitxor(s(1,1),93742684533);
end

for i = 2:36
    s(i,1) = bitshift(s(i - 1,1),1);
    if(s(i,1) > 68719476735)
        s(i,1) = bitxor(s(i,1),93742684533);
    end
end

zhishu = [36,34,32,31,30,28,25,24,22,21,20,19,18,17,...
    16,15,14,12,11,8,6,5,4,2,0];
sum = 0;
for i = 1:25
   sum = sum +  bitshift(1,zhishu(i));
end



%% gen2

zhishu = [36,35,31,30,29,28,25,21,19,18,17,15,11,8,7,6,5,1,0];
sum = 0;
for i = 1:length(zhishu)
   sum = sum +  bitshift(1,zhishu(i));
end

s = zeros(36,1);

s0 = 38422874595;

s(1,1) = bitshift(s0,1);

if(s(1,1) > 68719476735)
    s(1,1) = bitxor(s(1,1),107142351331);
end

for i = 2:36
    s(i,1) = bitshift(s(i - 1,1),1);
    if(s(i,1) > 68719476735)
        s(i,1) = bitxor(s(i,1),107142351331);
    end
end
