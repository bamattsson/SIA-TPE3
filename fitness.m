function [E] = fitness(W, testing, expected, gName, capas);
	maxError = 10;
	length = size(testing,1);

	test = testNet(W, testing, expected, gName, capas);

	E = 0;
	for i=1:length
	  E = 1/2*(test(i) - expected(i))^2 + E;
	end
	fitness = maxError-E; 
end