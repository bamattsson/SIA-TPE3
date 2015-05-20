function [W] = generateIndividuals(noIndividuals, capaOculta)

weights{1} = weightGenerator(1,capaOculta);
weights{2} = weightGenerator(capaOculta,1);
weights = trainNet(weights, 200, 1, 2000000, 10, 'tangente', -1, -1, -1, 0, 0);

for i=1:noIndividuals
  W{i} = trainNet(weights, 200, 1, 2000000, 7, 'tangente', -1, -1, -1, 0, 0);
end
