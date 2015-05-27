clear;
individualsAmount = 5;
gName = 'tangente';
capas = 2;
nodes1 = 4;
nodes2 = 2;
trainingAmount = 200;
selectionMode = 'elite';
selectionAmount = 2;
breakCriteria = 'maxIt';
breakVal = 100;
replacementStrategy = 1;
mutPoss = 0.05;
mutChange = 0.1;

breakCriteriaReached = 0;

[training, expected] = generateTrainingTPfunctionChosenOnes(trainingAmount);
W = generateIndividuals(individualsAmount, nodes1, nodes2);

%for i=1:individuals 
% test{i} = testNet(W{i}, training, expected, 'tangente', 1);
%end

for i=1:individualsAmount
  E(i) = fitness(W{i}, training, expected, gName, capas);
end

iteration = 0;
while (~breakCriteriaReached)
  iteration = iteration + 1;
  % Part that does the replacement
  switch (replacementStrategy)
    case (1)
      W_new = replacement1(W, individualsAmount, mutPoss, mutChange);
      clear('W');
      W = W_new;
    case (2)
      ;
    case (3)
      ;
  end

  % Evaluates the new individuals
  % NOTE: Maybe we should put this part in replacementX since it probably
  % needs to be calculated in replacement2 and replacement3
  for i=1:individualsAmount
    E(i) = fitness(W{i}, training, expected, gName, capas);
  end

  % Plotting the best individual and the mean
  medE(iteration) = mean(E);
  maxE(iteration) = max(E);
  itVec(iteration) = iteration;
  plot(itVec, medE, itVec, maxE); shg;

  % evaluating break critereas
  switch (breakCriteria)
    case 'maxIt'
      if (iteration > breakVal)
        breakCriteriaReached = 1;
      end
    case 'ETol'
      if (max(E) > breakVal)
        breakCriteriaReached = 1;
      end
    case 'structure'
      ;
    case 'content'
      ;
    case 'surrounding'
      ;
  end

end
