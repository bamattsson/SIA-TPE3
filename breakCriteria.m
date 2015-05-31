function breakCriteriaReached = breakCriteria(maxE, iteration, numContBreak, F, breakValFTol, iteration, breakValIt)
	breakCriteriaReached = mod(ContentBreak(maxE, iteration, numContBreak)+ ETol(F, breakValFTol)+ maxIterations(iteration, breakValIt),2);
end

% leaving this here if we want to change breakCriteria()
% evaluating break critereas
% switch (breakCriteria)
% 	case 'maxIt'
% 	  if (iteration > breakVal)
% 	    breakCriteriaReached = 1;
% 	  end
% 	case 'ETol'
% 	  if (max(E) > breakVal)
% 	    breakCriteriaReached = 1;
% 	  end
% 	case 'structure'
% 	  ;
% 	case 'content'
% 		breakCriteriaReached = ContentBreak(maxE, iteration, numContBreak);
% 	  ;
% 	case 'surrounding'
% 	  ;
% end

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