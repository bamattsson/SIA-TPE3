%pm = posibility of mutation

function [new_generation, numSurvivors] = replacement3(individuals, k, pm, change, selectionMode, m, t, training, expected, gName, capas, n1, secondSelectionMode, parentsFitness, replacementMode, secondReplacementMode)
	N = size(individuals,2);
	% selecciona k, recombina, muta y genera k hijos
	children = replacement1(individuals, k, pm, change, selectionMode, m ,t, parentsFitness, n1, secondSelectionMode);
	% une los nuevos hijos con la generación anterior obteniendo N+k
	allIndividuals = [individuals, children];
	allIndividualsAmount = size(allIndividuals,2);

	% calcula el fitness de todos
	for i=1:allIndividualsAmount
    	E(i) = fitness(allIndividuals{i}, training, expected, gName, capas);
  	end

  	% selecciona N para la próxima generacion
	new_generation = selection(allIndividualsAmount, allIndividuals, E, replacementMode, N, m, t, n1, secondReplacementMode);
	numSurvivors = countSurvivors(individuals, new_generation);
end

function numSurv = countSurvivors(gen1, gen2)
	numSurv=0;
	for i=1:size(gen2,2)
		done=0;
		for j=1:size(gen1,2)
			if((gen2{i}{1}==gen1{j}{1}) && done!=1)
				numSurv=numSurv+1;
				done=1;
			end
		end
	end
end