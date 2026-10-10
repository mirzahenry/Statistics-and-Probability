% Runs every question script one after another
for q = 1:7
    fprintf('\n================ QUESTION %d ================\n', q);
    run(sprintf('Question%d.m', q));
end
