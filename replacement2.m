function new_generation = replacement2(individuals, k, possibility, change, selectionMode, parentsFitness, m, iteration, n1, secondSelectionMode, replacementCriteria, secondReplacementMode, crossMode, pc)
	individualsAmount = size(individuals,2);
	
	% selecciona k, recombina, muta y genera k hijos
	children = replacement1(individuals, k, possibility, change, selectionMode, m ,iteration, parentsFitness, n1, secondSelectionMode, crossMode, pc);
	
	% selecciono N-k que pasan sin modificacion con algun criterio
	survivers = selection(individualsAmount, individuals, parentsFitness, replacementCriteria, individualsAmount - k, m, iteration, n1, secondReplacementMode);
	
	% uno los N-k con los nuevos hijos
	new_generation = [children, survivers];
	
end