clear
x = zeros(7770,1);
y = zeros(7770,1);
z = zeros(7770,1);
cnt = 1;
for i = 0:36
   for j = i + 1:36
      for k = j + 1:36
        x(cnt,1) = i;
        y(cnt,1) = j;
        z(cnt,1) = k;
        cnt = cnt + 1;
      end
   end
end
plot3(x,y,z);
grid minor


fill3([0,36,0,0,0],[1,0,36,1,1],[36,35,35,2,36],'b');
