function err3_gen(code_m,code_p)
% Èý¸ö´íÎóÉú³É
gen_length = 5000;
code_length = 73;
m_length = 37;


err_pos1 = int8(zeros(gen_length,1));
err_pos2 = int8(zeros(gen_length,1));
err_pos3 = int8(zeros(gen_length,1));

recv_m = zeros(gen_length,1);
recv_p = zeros(gen_length,1);

for i = 1:gen_length
    err_table = zeros(code_length,1);
    
    err_pos1(i,1) = ceil(rand()*code_length);
    while(err_pos1(i,1) == 0)   %±ÜÃâ´íÎóÎ»ÖÃÎª0
        err_pos1(i,1) = ceil(rand()*code_length);
    end
    err_table(err_pos1(i,1),1) = err_pos1(i,1);
    
    err_pos2(i,1) = ceil(rand()*code_length);
    while(err_pos2(i,1) == 0)   %±ÜÃâ´íÎóÎ»ÖÃÎª0
        err_pos2(i,1) = ceil(rand()*code_length);
    end
    while(err_table(err_pos2(i,1),1) ~= 0)  %±ÜÃâ´íÎóÎ»ÖÃÏàÍ¬
        err_pos2(i,1) = ceil(rand()*code_length);
    end
    err_table(err_pos2(i,1),1) = err_pos2(i,1);
    
    err_pos3(i,1) = ceil(rand()*code_length);
    while(err_pos3(i,1) == 0)   %±ÜÃâ´íÎóÎ»ÖÃÎª0
        err_pos3(i,1) = ceil(rand()*code_length);
    end
    while(err_table(err_pos3(i,1),1) ~= 0)  %±ÜÃâ´íÎóÎ»ÖÃÏàÍ¬
        err_pos3(i,1) = ceil(rand()*code_length);
    end

    if(err_pos1(i,1) >= m_length)
        err_m1 = bitshift(1,err_pos1(i,1) - m_length);
        temp_m = bitxor(err_m1,code_m(i,1));
        temp_p = code_p(i,1);
    else
        err_p1 = bitshift(1,err_pos1(i,1) - 1);
        temp_m = code_m(i,1);
        temp_p = bitxor(err_p1,code_p(i,1));
    end
    
    if(err_pos2(i,1) >= m_length)
        err_m2 = bitshift(1,err_pos2(i,1) - m_length);
        temp_m = bitxor(err_m2,temp_m);
    else
        err_p2 = bitshift(1,err_pos2(i,1) - 1);
        temp_p = bitxor(err_p2,temp_p);
    end
    
    if(err_pos3(i,1) >= m_length)
        err_m3 = bitshift(1,err_pos3(i,1) - m_length);
        recv_m(i,1) = bitxor(err_m3,temp_m);
        recv_p(i,1) = temp_p;
    else
        err_p3 = bitshift(1,err_pos3(i,1) - 1);
        recv_m(i,1) = temp_m;
        recv_p(i,1) = bitxor(err_p3,temp_p);
    end
end


for i = 1:gen_length
    temp = weight_cal(bitxor(code_m(i,1),recv_m(i,1)),bitxor(code_p(i,1),recv_p(i,1)));
    if(temp ~= 3)
        fprintf('%d\n',i);        
    end
end

fp = fopen('err3.txt','wt');
fprintf(fp, '_int64 recv_m3[%d] = {\n',gen_length);
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
fprintf(fp, '_int64 recv_p3[%d] = {\n',gen_length);
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

fprintf('err3_gen done\n');

end