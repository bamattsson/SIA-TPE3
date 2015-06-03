function [W] = generateIndividuals(noIndividuals, capaOculta1, capaOculta2, hasBackPropagation)

	weights{1} = weightGenerator(1,capaOculta1);
	weights{2} = weightGenerator(capaOculta1,capaOculta2);
	weights{3} = weightGenerator(capaOculta2,1);

%	[retWeight] = trainNet(weights, 200, 2, 2000000, 100, 'tangente', -1, -1, -1, 0, 0);

	for i=1:noIndividuals
%	  W{i} = trainNet(retWeight, 200, 2, 2000000, 100, 'tangente', -1, -1, -1, 0, 0);
      W{i}{1} = weights{1};
      W{i}{2} = weights{2};
      W{i}{3} = weights{3};
      [vec, dimension] = cellToVector(W{i});
      vec = simpleMutation(vec, 0.5, 0.3);
      W{i} = vectorToCell(vec,dimension);
	end

end