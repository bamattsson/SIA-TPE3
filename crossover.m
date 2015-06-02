function [children hasCross] = crossover(crossMode, parents, pc)
	r=rand();
	if(r<pc)
		switch(crossMode)
			case 'onePoint'
				children = crossoverOnePoint(parents);
				hasCross=1;
			case 'twoPoints'
				children = crossoverTwoPoint(parents);
				hasCross=1;
			case 'uniform'
				children = crossoverUniform(parents);
				hasCross=1;
			case 'anular'
				children = crossoverAnular(parents);
				hasCross=1;
			otherwise
				disp ('error in crossover mode');
		end
	else
		children=parents;
		hasCross=0;
	end
end