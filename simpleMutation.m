function individual = simpleMutation(individual, possibility)

mutated = 0;
M = mean(individual);
sigma = std(individual);

for i = 1:size(individual,2)
  if (rand() < possibility)
    individual(i) = sigma*randn() + M;
    mutated = 1;
  end
end


% If nothing changed, at least do one change in the individual
if (mutated == 0)
  individual(floor(rand*size(individual,2) + 1)) = sigma*randn() + M;
end
