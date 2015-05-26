function individual = simpleMutation(individual, possibility, change)

for i = 1:size(individual,2)
  if (rand() < possibility)
    individual(i) = individual(i)*(1 + randn()*change);
  end
end
