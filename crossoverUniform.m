function sons = crossoverUniform(parents)
	probability = 0.5;
	totalPositions = size(parents{1},2);
	for i=1:totalPositions
		if (parents{1}(i) == parents{2}(i))
			sons{1}(i) = parents{1}(i);
			sons{2}(i) = parents{1}(i);
		else
			aux = rand();
			if(aux > probability)
				%cambio los bits
				sons{1}(i) = parents{2}(i);
				sons{2}(i) = parents{1}(i);
			else
				%no cambio los bits
				sons{1}(i) = parents{1}(i);
				sons{2}(i) = parents{2}(i);
			end
		end
	end
end