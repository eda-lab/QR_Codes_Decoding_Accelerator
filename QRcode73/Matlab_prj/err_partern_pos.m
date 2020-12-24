clear;
close all;
%a = '111';
%b = '0000 0000 0000 0000 0000 0000 0000 0000 00';


for L2 = 2:36
code = '0000000000000000000000000000000000000';
L1 = 1;

code(1,L1) = '1';
code(1,L2) = '1';
L3 = L2 + 1;

for i = L3:37
   code2 =  code;
   code2(1,i) = '1';
   code_temp = code2;
   for j = 1:36
       code_temp = [code_temp(1,37),code_temp(1,1:36)];
       if(bin2dec(code_temp) == bin2dec(code2))
           fprintf('code_temp = %s\n',code_temp);
           fprintf('j = %d\n',j);
           break;
       end
   end
end
end

%% 输出基本错误图样，共210种

code = '1000000000000000000000000000000000000';
sum = 0;
for i = 1:12
    k = i + 1;
    for j = (2*i+1):(36-i+1)
        sum = sum + 1;
        code2 = code;
        code2(1,k) = '1';
        code2(1,j) = '1';
        fprintf('code2 = %s  k = %d  j = %d\n',code2,k,j);
    end
end

%% 输出全部错误图样，共7770种

code = '1000000000000000000000000000000000000';
sum = 0;
partten = zeros(7770,1);
for i = 1:12
    k = i + 1;
    for j = (2*i+1):(36-i+1)
        sum = sum + 1;
        code2 = code;
        code2(1,k) = '1';
        code2(1,j) = '1';
        fprintf('code2 = %s  k = %d  j = %d\n',code2,k,j);
        code3 = code2;
        partten(sum,1) = bin2dec(code3);
        for l = 1:36
           code3 = [code3(1,37),code3(1,1:36)];
           fprintf('code3 = %s\n',code3);
           sum = sum + 1;
           partten(sum,1) = bin2dec(code3);
        end
    end
end











