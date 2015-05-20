function [E] = fitness(W, training, expected, gName, capas);

length = size(training,1);

test = testNet(W, training, expected, gName, capas);

E = 0;
for i=1:length
  E = 1/2*(test(i) - expected(i))^2 + E;
end
