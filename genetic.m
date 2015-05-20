individuals = 3;
[training, expected] = generateTrainingTPfunctionChosenOnes(200);
W = generateIndividuals(individuals , 10);

for i=1:individuals 
  test{i} = testNet(W{i}, training, expected, 'tangente', 1);

end

disp(test);
