function selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k, selectionMode)
	totalFitness= sum(fitness);
	relativeFitness = fitness./totalFitness;
	cumulativeFitness = cumulativeSum(relativeFitness);
	r0=rand();

	for i=1:k
		if(strcmp(selectionMode,'roulette'))
			r=rand();
		elseif(strcmp(selectionMode,'universal'))
			r=(r0+i-1)/k;
		end
		done=0;
		for j=1:individualsAmount
			if(~done && cumulativeFitness(j)>r)
				done=1;
				selectIndiv{i}=individuals{j};
			end
		end
	end
end

function cum = cumulativeSum(vector)
	cum = vector;
	for i=1:size(vector,2)
		if(i>1)
			cum(i)=cum(i-1)+cum(i);
		end
	end
end

