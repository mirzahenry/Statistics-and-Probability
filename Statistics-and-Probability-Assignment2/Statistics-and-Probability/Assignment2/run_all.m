% Runs every question script one after another
for q = 1:15
    fprintf('\n================ QUESTION %d ================\n', q);
    run(sprintf('Question%d.m', q));
end
