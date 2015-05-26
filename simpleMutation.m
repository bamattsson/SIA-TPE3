function individual = simpleMutation(individual, possibility, change)
% individual - the individual in vector format
% possibility - the possibility that each element is mutated
% change - how big the change will be if a mutation happens, should be <1

for i = 1:size(individual,2)
  if (rand() < possibility)
    individual(i) = individual(i)*(1 + randn()*change);
  end
end
