function sons = crossoverAnular(parents, capas)
	totalPositions = size(parents{1},2);
	r = ceil(rand()*totalPositions);
	l = ceil(rand()*totalPositions/2);
	len = r+l;
	for i=1:(len)
		if (i < r)
			sons{1}(i) = parents{1}(i);
		end
		if (i >= r)
			sons{1}(mod(i,len)) = parents{2}(mod(i,len));
		end
	end
end