function crossMode = getCrossMode(value)
	switch value
		case 1
			crossMode = 'onePoint';
		case 2
			crossMode = 'twoPoints';
		case 3
			crossMode = 'uniform';
		case 4
			crossMode = 'anular';
		otherwise
			disp ('error in crossover mode');
	end
end