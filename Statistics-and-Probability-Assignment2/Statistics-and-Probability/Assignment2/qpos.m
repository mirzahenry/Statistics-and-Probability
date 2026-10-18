function q = qpos(x, p)
% (n+1)p-th ordered value, as used in the lecture (linear interpolation)
x = sort(x(:)); n = numel(x); pos = p*(n+1);
lo = floor(pos); fr = pos - lo;
if lo < 1
    q = x(1);
elseif lo >= n
    q = x(n);
else
    q = x(lo) + fr*(x(lo+1) - x(lo));
end
end
