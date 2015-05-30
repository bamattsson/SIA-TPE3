clear;
individualsAmount = 5;
gName = 'tangente';
capas = 2;
nodes1 = 4;
nodes2 = 2;
trainingAmount = 200;

selectionMode = 'mix';
selectionAmount = 2;
m = 2;
t = 0.5;
n1= 1;
secondSelectionMode = 'probTournament';

breakCriteria = 'maxIt';
breakVal = 100;

replacementStrategy = 1;

notUniformMutation = 0;
mutPoss = 0.05;
mutChange = 0.1;

breakCriteriaReached = 0;

[training, expected] = generateTrainingTPfunctionChosenOnes(trainingAmount);
W = generateIndividuals(individualsAmount, nodes1, nodes2);

%for i=1:individuals 
% test{i} = testNet(W{i}, training, expected, 'tangente', 1);
%end

% Loop that governs the evolution
iteration = 0;
while (~breakCriteriaReached)
	iteration = iteration + 1;
	for i=1:individualsAmount
	  E(i) = fitness(W{i}, training, expected, gName, capas);
	end
  % Part that does the replacement
  	switch (replacementStrategy)
		case (1)
      		W_new = replacement1(W, individualsAmount, mutPoss, mutChange, selectionMode, m ,t, E, n1, secondSelectionMode);
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

  %Changing mutPoss if using Not Uniform Mutation
  if (notUniformMutation)
    if (mutPoss > 0.01);
      mutPoss = mutPoss*0.95;
    end
  end

end
