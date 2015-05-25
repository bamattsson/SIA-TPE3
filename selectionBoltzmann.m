% k = number of selected individuals
% t = number of generation

function selectedInd = selectionBoltzmann(individualsAmount, individuals, fitness, k, t)
	threshold = 1;
	selectedInd = {};
	numSelected=1;

	expVal = expectedValue(t, fitness, individualsAmount);
	for i=1:individualsAmount
		if(expVal(i)>threshold)
			%disp(i);
			selectedInd{numSelected} = individuals{i}
			numSelected=numSelected+1;
		end
	end
end

function expVal = expectedValue(t, fitness, individualsAmount)
	for i=1:individualsAmount
		preExpVal(i)= exp(fitness(i)/t);
	end
	%disp('preExpVal');
	%disp(preExpVal)
	%disp(sum(preExpVal))
	%disp(size(preExpVal,2))
	promExpVal=sum(preExpVal)/size(preExpVal,2);
	expVal = preExpVal./promExpVal;
end