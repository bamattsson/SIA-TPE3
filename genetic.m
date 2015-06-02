clear; clf;
gName = 'tangente';
capas = 2;
nodes1 = 4;
nodes2 = 2;
trainingAmount = 200;

m = 2;
t = 0.5; %% between 0 and 1!
n1= 1;

notUniformMutation = 0;
mutChange = 0.1;

breakCriteriaReached = 0;
numContBreak = 100;
breakValFTol = 500;
breakTolStruct = 0.9; % between 0 and 1
numSurvivors=0; % inicializacion, esto no va a archivo de conf
iterationsStrc=0; % counter for structure break
numItStrucTol = 10; %number of generations compared for structure break

hasBackPropagation = 1;

%-%%%%%%%%%Loading values from init csv%%%%%%%%%%%%%
values = csvread('./csv/init.csv');
replacementMode = values(1,2);
individualsAmount = values(2,2);
selectionAmount = values(3,2);
maxGenerations = values(4,2);
mutationProbability = values(5,2);
selectionMode = getSelectionMode(values(6,2));
replacementCriteria = getSelectionMode(values(7,2));
secondSelectionMode = getSecondSelectionMode(values(8,2));
secondReplacementMode = getSecondSelectionMode(values(9,2));
crossMode = getCrossMode(values(10,2));
%-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pc=0.9;

[training, expected] = generateTrainingTPfunctionChosenOnes(trainingAmount);
W = generateIndividuals(individualsAmount, nodes1, nodes2);

for i=1:individualsAmount
  F(i) = fitness(W{i}, training, expected, gName, capas);
end
% Loop that governs the evolution
shg;
iteration = 0;
while (~breakCriteriaReached)
	iteration = iteration + 1;
  % Part that does the replacement
  switch (replacementMode)
    case (1)
      W_new = replacement1(W, individualsAmount, mutationProbability, mutChange, selectionMode, m ,t, F, n1, secondSelectionMode, crossMode, pc);
      clear('W');
      W = W_new;
    case (2)
    	% selection amount = k, chequear esto
      W_new = replacement2(W, selectionAmount, mutationProbability, mutChange, selectionMode, F, m, selectionAmount, n1, secondSelectionMode, replacementCriteria, secondReplacementMode);
      clear('W');
      W = W_new;
    case (3)
      [W_new numSurvivors]= replacement3(W, selectionAmount, mutationProbability, mutChange, selectionMode, m, t, training, expected, gName, capas, n1, secondSelectionMode, F, replacementCriteria, secondReplacementMode, hasBackPropagation);
      clear('W');
      W = W_new;
  end

	% Evaluates the new individuals
	% NOTE: Maybe we should put this part in replacementX since it probably
	% needs to be calculated in replacement2 and replacement3
	if(hasBackPropagation)
		for i=1:individualsAmount
	  	W{i} = trainNet(W{i}, 100, 2, 100*50, 7, 'tangente', -1, -1, -1, 0, 0);
		end
	end

	for i=1:individualsAmount
		F(i) = fitness(W{i}, training, expected, gName, capas);
    end
    

  % Plotting the best individual and the mean
  medF(iteration) = mean(F);
  [maxF(iteration), max_index] = max(F);
  itVec(iteration) = iteration;
  Out = zeros(size(training,1),1);
  for j=1:size(training,1)
      [h_1, V_1] = calculateLayer(W{max_index}{1}, [-1; training(j)], gName);
      [h_2, V_2] = calculateLayer(W{max_index}{2}, V_1, gName);
      [h_3, o] = calculateLayer(W{max_index}{3}, V_2, 'lineal');
      Out(j) = o(2);
  end
   subplot(1,2,2);title('Mejor individuo');
   plot(training',Out); hold on;
   plot(training',expected,'r*'); hold off; shg;  
  subplot(1,2,1);title('Cambio en el error');
  plot(itVec, medF, itVec, maxF);
  drawnow;
  

	[breakCriteriaReached, iterationsStrc] = breakCriteria(maxF, iteration,numContBreak, F, breakValFTol, maxGenerations, numSurvivors, size(W,2), breakTolStruct,iterationsStrc, numItStrucTol);

  %Changing mutationProbability if using Not Uniform Mutation
  if (notUniformMutation)
    if (mutationProbability > 0.01);
      mutationProbability = mutationProbability*0.95;
    end
  end

end
