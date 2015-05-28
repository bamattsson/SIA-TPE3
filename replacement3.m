%pm = posibility of mutation

function new_generation = replacement3(individuals, k, pm, change, selectionMode, m, t, training, expected, gName, capas)
	N = size(individuals,2);
	% selecciona k, recombina, muta y genera k hijos
	children = replacement1(individuals, k, pm, change);

	% une los nuevos hijos con la generación anterior obteniendo N+k
	allIndividuals = [individuals, children];
	allIndividualsAmount = size(allIndividuals,2);

	% calcula el fitness de todos
	for i=1:allIndividualsAmount
    	E(i) = fitness(allIndividuals{i}, training, expected, gName, capas);
  	end

  	% selecciona N para la próxima generacion
	new_generation = selection(allIndividualsAmount, allIndividuals, E, selectionMode, N, m, t);
end