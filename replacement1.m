function children = replacement1(individuals, outputAmount, pm, change, selectionMode, m ,t, parentsFitness, n1, secondSelectionMode, crossMode, pc)

  numberOfParents = size(individuals, 2);

  for i = 1:outputAmount
    hasCross=0;
    while(hasCross==0)
      parents = selection(numberOfParents, individuals,parentsFitness,selectionMode, 2, m, t, n1, secondSelectionMode);
      [parent1 dimension] = cellToVector(parents{1});
      [parent2 dimension] = cellToVector(parents{2});
   
      [child hasCross] = crossover(crossMode,{parent1, parent2}, pc);
    end

    children{i} = simpleMutation(child{1}, pm, change);
    if (i < outputAmount)
      i = i+1;
      children{i} = simpleMutation(child{2}, pm, change);
    end
  end

  for i = 1:outputAmount
    children{i} = vectorToCell(children{i}, dimension);
  end

end