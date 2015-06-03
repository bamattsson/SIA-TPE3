function selectionMode = getSecondSelectionMode(value)
	switch value
		case 1
			selectionMode = 'roulette';
		case 2
			selectionMode = 'universal';
		otherwise
			disp('error in selection mode');
	end
end