function new_generation = replacement2(individuals, k, possibility, change, selectionMode, parentsFitness, m, t, n1, secondSelectionMode, replacementMode, secondReplacementMode)
	
	individualsAmount = size(individuals,2);
	
	% selecciona k, recombina, muta y genera k hijos
	children = replacement1(individuals, k, possibility, change, selectionMode, m ,t, parentsFitness, n1, secondSelectionMode);
	
	% selecciono N-k que pasan sin modificacion con algun criterio
	survivers = selection(individualsAmount, individuals, parentsFitness, replacementMode, individualsAmount - k, m, t, n1, secondReplacementMode);
	
	% uno los N-k con los nuevos hijos
	new_generation = [children, survivers];
	
end