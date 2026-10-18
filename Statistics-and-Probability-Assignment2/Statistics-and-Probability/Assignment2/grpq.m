function x = grpq(p, edges, f)
% p-th quantile of grouped data:  l + (h/f)(p*n - c)
n = sum(f); cf = cumsum(f); c0 = [0 cf];
i = find(cf >= p*n, 1);
h = edges(i+1) - edges(i);
x = edges(i) + h/f(i)*(p*n - c0(i));
end
