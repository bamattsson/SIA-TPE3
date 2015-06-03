function [retFitness] = fitness(W, testing, expected, gName, capas);
	
	len = size(testing,1);

	test = testNet(W, testing, expected, gName, capas);

	E = 0;
	for i=1:len
	  E = 1/2*(test(i) - expected(i))^2 + E;
	end
	retFitness = 1/(E/len);
end