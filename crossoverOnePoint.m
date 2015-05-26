function sons = crossoverOnePoint(parents, capas)
	totalPositions=0;
	for i=1:capas+1
		positions(i) = size(parents{1}{i},1)*size(parents{1}{i},2);
		totalPositions = totalPositions + positions(i);
		W{i}=parents{1}{i};
	end
	r= ceil(rand()*totalPositions);

	[parents{1}, dimensions{1}] = cellToVector(parents{1});
	[parents{2}, dimensions{2}] = cellToVector(parents{2});

	sons{1} = [parents{1}(:,1:(r-1)),parents{2}(:,r:end)];
	sons{2} = [parents{2}(:,1:(r-1)),parents{1}(:,r:end)];
end