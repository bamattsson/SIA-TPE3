function selectionMode = getSelectionMode(value)
	switch value
		case 1
			selectionMode = 'elite';
		case 2
			selectionMode = 'detTournament';
		case 3
			selectionMode = 'probTournament';
		case 4
			selectionMode = 'roulette';
		case 5
			selectionMode = 'universal';
		case 6
			selectionMode = 'boltzmann';
		case 7
			selectionMode = 'mix';
		otherwise 
      		disp('error in selection mode');
	end
end

