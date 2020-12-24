function weight = weight_cal(code_m,code_p)

sum_m = 0;
for i = 1:37
    if(bitand(code_m,bitshift(1,i - 1)) > 0)
        sum_m = sum_m + 1;
    end    
end

sum_p = 0;
for i = 1:36
    if(bitand(code_p,bitshift(1,i - 1)) > 0)
        sum_p = sum_p + 1;
    end    
end


weight = sum_m + sum_p;

end
