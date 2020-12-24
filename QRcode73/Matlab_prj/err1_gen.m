function err1_gen(code_m,code_p)
% 单个错误生成
gen_length = 5000;
err_pos1 = zeros(gen_length,1);
err_m1 = zeros(gen_length,1);
err_p1 = zeros(gen_length,1);

recv_m = zeros(gen_length,1);
recv_p = zeros(gen_length,1);
for i = 1:gen_length
    err_pos1(i,1) = int8(rand()*73);
    while(err_pos1(i,1) == 0)
        err_pos1(i,1) = int8(rand()*73);
    end
    if(err_pos1(i,1) >= 37)
        err_m1(i,1) = bitshift(1,err_pos1(i,1) - 37);
        recv_m(i,1) = bitxor(err_m1(i,1),code_m(i,1));
        recv_p(i,1) = code_p(i,1);
    else
        err_p1(i,1) = bitshift(1,err_pos1(i,1) - 1);
        recv_m(i,1) = code_m(i,1);
        recv_p(i,1) = bitxor(err_p1(i,1),code_p(i,1));
    end
end



for i = 1:gen_length
    temp = weight_cal(bitxor(code_m(i,1),recv_m(i,1)),bitxor(code_p(i,1),recv_p(i,1)));
    if(temp ~= 1)
        fprintf('%d\n',i);        
    end
end

fp = fopen('err1.txt','wt');
fprintf(fp, '_int64 recv_m1[%d] = {\n',gen_length);
for i = 1:gen_length
    if (i < gen_length)
        fprintf(fp, '%d,', recv_m(i,1));
    else
        fprintf(fp, '%d', recv_m(i,1));
    end
    if(mod(i,10) == 0)
        fprintf(fp,'\n');
    end
end
fprintf(fp, '};\n');
fprintf(fp, '_int64 recv_p1[%d] = {\n',gen_length);
for i = 1:gen_length
    if (i < gen_length)
        fprintf(fp, '%d,', recv_p(i,1));
    else
        fprintf(fp, '%d', recv_p(i,1));
    end
    if(mod(i,10) == 0)
        fprintf(fp,'\n');
    end
end
fprintf(fp, '};\n');
fclose(fp);

fprintf('err1_gen done\n');

end