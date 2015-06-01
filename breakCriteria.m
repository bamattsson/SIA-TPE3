function [breakCriteriaReached, iterationsStrc] = breakCriteria(maxE, iteration, numContBreak, F, breakValFTol, breakValIt, numSurvivors, sizeGeneration, breakTolStruct, iterationsStrc, numItStrucTol)
	aux = ContentBreak(maxE, iteration, numContBreak)+ FTol(F, breakValFTol)+ maxIterations(iteration, breakValIt);
	[aux2 iterationsStrc] = StructureBreak(numSurvivors, sizeGeneration, breakTolStruct, iterationsStrc, numItStrucTol);
	if(aux+aux2>=1)
		breakCriteriaReached=1;
	else
		breakCriteriaReached=0;
	end
end

function hasToBreak = ContentBreak(maxF, iteration, numContBreak)
	i=numContBreak;
	hasToBreak = 0;
	if(iteration>numContBreak)
	hasToBreak = 1;
		while(i!=0)
			if(maxF(iteration-i)!=maxF(iteration-i+1))
				hasToBreak = 0;
				break;
			end
			i = i-1;
		end
	end
	if(hasToBreak)
		disp('Breaking: Content Break');
	end
end

function hasToBreak = FTol(F, breakValFTol)
	hasToBreak=0;
	if (max(F) > breakValFTol)
	    hasToBreak = 1;
	    disp('Breaking: Optimal Fitness Reached');
	end
end

function hasToBreak = maxIterations(iteration, breakValIt)
	hasToBreak=0;
	if (iteration > breakValIt)
	    hasToBreak = 1;
	    disp('Breaking: Max Iterations Reached');
	end
end

function [hasToBreak, iterationsStrc] = StructureBreak(numSurvivors, sizeGeneration, maxTolerance, iterationsStrc, numItStrucTol)
	hasToBreak = 0;
	if((numSurvivors/sizeGeneration)>maxTolerance)
		iterationsStrc=iterationsStrc+1;
		if(iterationsStrc>numItStrucTol)
			hasToBreak=1;
			disp('Breaking: Structure Break');
		end
	else
		iterationsStrc=0;
	end
end