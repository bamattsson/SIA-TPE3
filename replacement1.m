function childrens = replacement1( individuals, outputAmount, possibility, change)

numberOfParents = size(individuals, 2);
for i = 1:numberOfParents
  [individuals_vec{i} dimension] = cellToVector(individuals{i});
end

for i = 1:outputAmount

  num1 = floor(rand*numberOfParents + 1); num2 = num1;
  while (num1 == num2)
    num2 = floor(rand*numberOfParents + 1);
  end

  parent1 = individuals_vec{num1};
  parent2 = individuals_vec{num2};

  child = crossoverOnePoint({parent1, parent2});

  childrens{i} = simpleMutation(child{1}, possibility, change);
  if (i < outputAmount)
    i = i+1;
    childrens{i} = simpleMutation(child{2}, possibility, change);
  end

end

for i = 1:numberOfParents
  childrens{i} = vectorToCell(childrens{i}, dimension);
end
