function selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k, selectionMode)
	totalFitness= sum(fitness)
	relativeFitness = fitness./totalFitness
	cumulativeFitness = cumulativeSum(relativeFitness)
	r0=rand();

	for i=1:k
		if(selectionMode == 'roulette')
			r=rand();
		elseif(selectionMode == 'universal')
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
	acum = vector;
	for i=1:size(vector,2)
		if(i>1)
			acum(i)=acum(i-1)+acum(i);
		end
	end
end
