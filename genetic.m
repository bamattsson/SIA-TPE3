clear; clf;
gName = 'tangente';
capas = 2;
nodes1 = 4;
nodes2 = 2;
trainingAmount = 200;

m = 2;
t = 0.5; %% between 0 and 1!
n1= 2;

notUniformMutation = 0;
mutChange = 0.1;

breakCriteriaReached = 0;
numContBreak = 7;
breakValFTol = 250;
breakTolStruct = 0.9; % between 0 and 1
numSurvivors=0; % inicializacion, esto no va a archivo de conf
iterationsStrc=0; % counter for structure break
numItStrucTol = 7; %number of generations compared for structure break

%-%%%%%%%%%Loading values from init csv%%%%%%%%%%%%%
values = csvread('./csv/init.csv',0,1);
replacementMode = values(1);
individualsAmount = values(2);
selectionAmount = values(3);
maxGenerations = values(4);
mutationProbability = values(5);
selectionMode = getSelectionMode(values(6));
replacementCriteria = getSelectionMode(values(7));
secondSelectionMode = getSecondSelectionMode(values(8));
secondReplacementMode = getSecondSelectionMode(values(9));
crossMode = getCrossMode(values(10));
backpropagationPoss = values(11);
%-%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pc=0.9;

[training, expected] = generateTrainingTPfunction(trainingAmount);
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
      W_new = replacement1(W, individualsAmount, mutationProbability, mutChange, selectionMode, m ,iteration, F, n1, secondSelectionMode, crossMode, pc);
      clear('W');
      W = W_new;
    case (2)
    	% selection amount = k, chequear esto
      W_new = replacement2(W, selectionAmount, mutationProbability, mutChange, selectionMode, F, m, iteration, n1, secondSelectionMode, replacementCriteria, secondReplacementMode, crossMode, pc);
      clear('W');
      W = W_new;
    case (3)
      [W_new numSurvivors]= replacement3(W, selectionAmount, mutationProbability, mutChange, selectionMode, m, iteration, training, expected, gName, capas, n1, secondSelectionMode, F, replacementCriteria, secondReplacementMode, crossMode, pc);
      clear('W');
      W = W_new;
  end
  
	% Evaluates the new individuals
	% NOTE: Maybe we should put this part in replacementX since it probably
	% needs to be calculated in replacement2 and replacement3
    for i=1:individualsAmount
        if (rand < backpropagationPoss)
            W{i} = trainNet(W{i}, 200, 2, 20, 0.0001, 'tangente', -1, -1, -1, 0, 0);
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

  figure(1)
  subplot(1,2,2);
  plot(training',Out); 
  title('Mejor individuo');
  xlabel('x');
  ylabel('y');
  hold on;
  plot(training',expected,'r'); hold off; shg;  
  subplot(1,2,1);
  plot(itVec, medF, itVec, maxF);
  legend('Fitness Promedio', 'Fitness maximo');
  title('Cambio en el error');
  xlabel('iteracion');
  ylabel('fitness');
  drawnow;
  

	[breakCriteriaReached, iterationsStrc] = breakCriteria(maxF, iteration,numContBreak, F, breakValFTol, maxGenerations, numSurvivors, size(W,2), breakTolStruct,iterationsStrc, numItStrucTol);

  %Changing mutationProbability if using Not Uniform Mutation
  if (notUniformMutation)
    if (mutationProbability > 0.01);
      mutationProbability = mutationProbability*0.95;
    end
  end
end

% Imprimir error
disp(1/maxF(iteration));
