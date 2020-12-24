function err6_gen(code_m,code_p)
% Áù¸ö´íÎóÉú³É
gen_length = 5000;
code_length = 73;
m_length = 37;

err_pos1 = int8(zeros(gen_length,1));
err_pos2 = int8(zeros(gen_length,1));
err_pos3 = int8(zeros(gen_length,1));
err_pos4 = int8(zeros(gen_length,1));
err_pos5 = int8(zeros(gen_length,1));
err_pos6 = int8(zeros(gen_length,1));

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
    err_table(err_pos3(i,1),1) = err_pos3(i,1);
    
    err_pos4(i,1) = ceil(rand()*code_length);
    while(err_pos4(i,1) == 0)   %±ÜÃâ´íÎóÎ»ÖÃÎª0
        err_pos4(i,1) = ceil(rand()*code_length);
    end
    while(err_table(err_pos4(i,1),1) ~= 0)  %±ÜÃâ´íÎóÎ»ÖÃÏàÍ¬
        err_pos4(i,1) = ceil(rand()*code_length);
    end
    err_table(err_pos4(i,1),1) = err_pos4(i,1);
    
    err_pos5(i,1) = ceil(rand()*code_length);
    while(err_pos5(i,1) == 0)   %±ÜÃâ´íÎóÎ»ÖÃÎª0
        err_pos5(i,1) = ceil(rand()*code_length);
    end
    while(err_table(err_pos5(i,1),1) ~= 0)  %±ÜÃâ´íÎóÎ»ÖÃÏàÍ¬
        err_pos5(i,1) = ceil(rand()*code_length);
    end
    err_table(err_pos5(i,1),1) = err_pos5(i,1);
    
    err_pos6(i,1) = ceil(rand()*code_length);
    while(err_pos6(i,1) == 0)   %±ÜÃâ´íÎóÎ»ÖÃÎª0
        err_pos6(i,1) = ceil(rand()*code_length);
    end
    while(err_table(err_pos6(i,1),1) ~= 0)  %±ÜÃâ´íÎóÎ»ÖÃÏàÍ¬
        err_pos6(i,1) = ceil(rand()*code_length);
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
        temp_m = bitxor(err_m3,temp_m);
    else
        err_p3 = bitshift(1,err_pos3(i,1) - 1);
        temp_p = bitxor(err_p3,temp_p);
    end
    
    if(err_pos4(i,1) >= m_length)
        err_m4 = bitshift(1,err_pos4(i,1) - m_length);
        temp_m = bitxor(err_m4,temp_m);
    else
        err_p4 = bitshift(1,err_pos4(i,1) - 1);
        temp_p = bitxor(err_p4,temp_p);
    end
    
    if(err_pos5(i,1) >= m_length)
        err_m5 = bitshift(1,err_pos5(i,1) - m_length);
        temp_m = bitxor(err_m5,temp_m);
    else
        err_p5 = bitshift(1,err_pos5(i,1) - 1);
        temp_p = bitxor(err_p5,temp_p);
    end
    
    if(err_pos6(i,1) >= m_length)
        err_m6 = bitshift(1,err_pos6(i,1) - m_length);
        recv_m(i,1) = bitxor(err_m6,temp_m);
        recv_p(i,1) = temp_p;
    else
        err_p6 = bitshift(1,err_pos6(i,1) - 1);
        recv_m(i,1) = temp_m;
        recv_p(i,1) = bitxor(err_p6,temp_p);
    end
end

for i = 1:gen_length
    temp = weight_cal(bitxor(code_m(i,1),recv_m(i,1)),bitxor(code_p(i,1),recv_p(i,1)));
    if(temp ~= 6)
        fprintf('%d\n',i);        
    end
end

fp = fopen('err6.txt','wt');
fprintf(fp, '_int64 recv_m6[%d] = {\n',gen_length);
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
fprintf(fp, '_int64 recv_p6[%d] = {\n',gen_length);
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

fprintf('err6_gen done\n');

end