clear; clf;
individualsAmount = 10;
gName = 'tangente';
capas = 2;
nodes1 = 4;
nodes2 = 2;
trainingAmount = 200;

selectionMode = 'elite';
selectionAmount = 2;
m = 2;
t = 0.5; %% between 0 and 1!
n1= 1;
secondSelectionMode = 'universal'; %%used just when selection is 'mix'

replacementMode = 'elite';
secondReplacementMode = 'universal';

% breakCriteria = 'content';
breakVal = 100;

replacementStrategy = 3;

notUniformMutation = 0;
mutPoss = 0.2;
mutChange = 0.1;

breakCriteriaReached = 0;
numContBreak = 10;
breakValFTol = 100;
breakValIt = 100;

[training, expected] = generateTrainingTPfunctionChosenOnes(trainingAmount);
W = generateIndividuals(individualsAmount, nodes1, nodes2);

% Loop that governs the evolution
shg;
iteration = 0;
while (~breakCriteriaReached)
	iteration = iteration + 1;
	for i=1:individualsAmount
	  F(i) = fitness(W{i}, training, expected, gName, capas);
	end
  % Part that does the replacement
  switch (replacementStrategy)
    case (1)
      W_new = replacement1(W, individualsAmount, mutPoss, mutChange, selectionMode, m ,t, F, n1, secondSelectionMode);
      clear('W');
      W = W_new;
    case (2)
      W_new = replacement2(W, selectionAmount, mutPoss, mutChange, selectionMode, F, m, selectionAmount, n1, secondSelectionMode, replacementMode, secondReplacementMode);
      clear('W');
      W = W_new;
    case (3)
      W_new = replacement3(W, selectionAmount, mutPoss, mutChange, selectionMode, m, t, training, expected, gName, capas, n1, secondSelectionMode, F, replacementMode, secondReplacementMode);
      clear('W');
      W = W_new;
  end

	% Evaluates the new individuals
	% NOTE: Maybe we should put this part in replacementX since it probably
	% needs to be calculated in replacement2 and replacement3
	for i=1:individualsAmount
		F(i) = fitness(W{i}, training, expected, gName, capas);
	end

  % Plotting the best individual and the mean
  medF(iteration) = mean(F);
  maxF(iteration) = max(F);
  max(F);
  itVec(iteration) = iteration;
  plot(itVec, medF, itVec, maxF); 
  drawnow;

	breakCriteriaReached = breakCriteria(maxF, iteration,numContBreak, F, breakValFTol, iteration, breakValIt);

  %Changing mutPoss if using Not Uniform Mutation
  if (notUniformMutation)
    if (mutPoss > 0.01);
      mutPoss = mutPoss*0.95;
    end
  end

end

