function sons = crossoverTwoPoint(parents)
	totalPositions = size(parents{1},2);
	r1 = ceil(rand()*totalPositions);
	r2 = ceil(rand()*totalPositions);
	if (r2 < r1)
		aux = r1;
		r1 = r2;
		r2 = aux;
	end

	
	if (r1+r2-1 >= totalPositions)
		sons{1}=[parents{1}(:,1:(r1-1)), parents{2}(:,r1:end)];
		sons{2}=[parents{2}(:,1:(r1-1)), parents{1}(:,r1:end)];
	else
		sons{1}=[parents{1}(:,1:(r1-1)), parents{2}(:,r1:(r1+r2-1)), parents{1}(:,(r1+r2):end)];
		sons{2}=[parents{2}(:,1:(r1-1)), parents{1}(:,r1:(r1+r2-1)), parents{2}(:,(r1+r2):end)];
	end
end