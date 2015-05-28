% k = number of selected individuals
% t = number of generation

function selectIndiv = selectionBoltzmann(individualsAmount, individuals, fitness, k, t)
	threshold = 1;
	selectedInd = {};
	numSelected=1;

	expVal = expectedValue(t, fitness, individualsAmount);
	cumExp = cumulativeSum(expVal);

	for i=1:k
		aux = cumExp(size(cumExp,1),size(cumExp,2));
		r=rand()*aux;
		done=0;
		for j=1:individualsAmount
			if(~done && cumExp(j)>r)
				done=1;
				selectIndiv{i}=individuals{j};
			end
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

function cum = cumulativeSum(vector)
	cum = vector;
	for i=1:size(vector,2)
		if(i>1)
			cum(i)=cum(i-1)+cum(i);
		end
	end
end