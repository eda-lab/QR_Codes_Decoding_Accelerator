
order = zeros(36,1);
for i = 1:36
    order(i,1) = mod(i*i,73);
end

order = sort(order);