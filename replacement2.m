function new_generation = replacement2(individuals, k, possibility, change, selectionMode, fitness, m, t)
	individualsAmount = size(individuals,2);
	
	% selecciona k, recombina, muta y genera k hijos
	children = replacement1(individuals, k, possibility, change);
	
	% selecciono N-k que pasan sin modificacion con algun criterio
	survivers = selection(individualsAmount, individuals, fitness, selectionMode, individualsAmount - k, m, t);
	
	% uno los N-k con los nuevos hijos
	new_generation = [children, survivers];
end