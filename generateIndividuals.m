function [W] = generateIndividuals(noIndividuals, capaOculta1, capaOculta2)

weights{1} = weightGenerator(1,capaOculta1);
weights{2} = weightGenerator(capaOculta1,capaOculta2);
weights{3} = weightGenerator(capaOculta2,1);

[retWeight] = trainNet(weights, 200, 2, 2000000, 10, 'tangente', -1, -1, -1, 0, 0);

for i=1:noIndividuals
  W{i} = trainNet(retWeight, 200, 2, 2000000, 7, 'tangente', -1, -1, -1, 0, 0);
end
