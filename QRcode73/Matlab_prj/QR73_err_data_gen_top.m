clear ;

%% Ëæ»úÉú³ÉÂë×Ö
gen_length = 5000;
code_m = zeros(gen_length,1);
code_p = zeros(gen_length,1);


for i = 1:gen_length
   code_m(i,1) = floor(rand() * bitshift(1,36));
   code_p(i,1) = QR73_mod(code_m(i,1));
end

fp = fopen('code.txt','wt');
fprintf(fp, 'code_m\n');
for i = 1:gen_length
    fprintf(fp, '%d,\n', code_m(i,1));
end
fprintf(fp, 'code_p\n');
for i = 1:gen_length
    fprintf(fp, '%d,\n', code_p(i,1));
end
fclose(fp);






err1_gen(code_m,code_p);

err2_gen(code_m,code_p);

err3_gen(code_m,code_p);

err4_gen(code_m,code_p);

err5_gen(code_m,code_p);

err6_gen(code_m,code_p);