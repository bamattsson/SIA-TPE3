function sons = crossoverAnular(parents)
	totalPositions = size(parents{1},2);
	r = ceil(rand()*totalPositions);
	l = ceil(rand()*totalPositions/2);
	len = r+l;
	for i=1:(len)
		if (i < r)
			sons{1}(i) = parents{1}(i);
			sons{2}(i) = parents{2}(i);
		elseif (i >= r && i <= totalPositions)
			sons{1}(i) = parents{2}(i);
			sons{2}(i) = parents{1}(i);
		elseif (i >= r && i > totalPositions)
			sons{1}(mod(i,totalPositions)) = parents{2}(mod(i,totalPositions));
			sons{2}(mod(i,totalPositions)) = parents{1}(mod(i,totalPositions));
	end
end