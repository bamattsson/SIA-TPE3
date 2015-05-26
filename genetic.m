individualsAmount = 4;
gName = 'tangente';
capas = 2;
nodes1 = 4;
nodes2 = 2;
trainingAmount = 200;
selectionMode = 'elite';
selectionAmount = 2;

[training, expected] = generateTrainingTPfunctionChosenOnes(trainingAmount);
W = generateIndividuals(individualsAmount, nodes1, nodes2);

%for i=1:individuals 
% test{i} = testNet(W{i}, training, expected, 'tangente', 1);
%end

for i=1:individualsAmount
  E(i) = fitness(W{i}, training, expected, gName, capas);
end

disp(E);

selection(individualsAmount, W, E, selectionMode, selectionAmount);