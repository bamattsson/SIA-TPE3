function sons = crossoverAnular(parents)
	totalPositions = size(parents{1},2);
	r = ceil(rand()*totalPositions);
	l = ceil(rand()*totalPositions/2);
	if (r+l == totalPositions)
		sons{1} = [parents{1}(1:r-1), parents{2}(r:end)];
		sons{2} = [parents{2}(1:r-1), parents{1}(r:end)];
	elseif (r+l < totalPositions)
		sons{1} = [parents{1}(1:r-1), parents{2}(r:r+l), parents{1}(r+l+1:end)];
		sons{2} = [parents{2}(1:r-1), parents{1}(r:r+l), parents{2}(r+l+1:end)];
	else
		aux1 = [parents{1}(1:r-1), parents{2}(r:end)];
		aux1(1:(l-(totalPositions-r))) = parents{2}(1:(l-(totalPositions-r)));
		sons{1} = aux1;
		aux2 = [parents{2}(1:r-1), parents{1}(r:end)];
		aux2(1:(l-(totalPositions-r))) = parents{1}(1:(l-(totalPositions-r)));
		sons{2} = aux2;
	end
end