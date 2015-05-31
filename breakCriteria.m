function breakCriteriaReached = breakCriteria(maxE, iteration, numContBreak, F, breakValFTol)
	breakCriteriaReached = mod(ContentBreak(maxE, iteration, numContBreak)+ ETol(F, breakValFTol),2);
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
end

function hasToBreak = ETol(F, breakValFTol)
	hasToBreak=0;
	if (max(F) > breakValFTol)
	    hasToBreak = 1;
	end
end

function hasToBreak = maxIterations(iteration, breakValIt)
	hasToBreak=0;
	if (iteration > breakValIt)
	    hasToBreak = 1;
	end
end