function [individual] = vectorToCell(vec, dimension)

%TODO: change if there are more layers

individual{1} = zeros(dimension(1), dimension(2));
individual{2} = zeros(dimension(3), dimension(4));

for i=1:dimension(2);
  individual{1}(:,i) = transpose(vec(1 + (i - 1)*dimension(1):i*dimension(1)));
end

for i=1:dimension(4);
  individual{2}(:,i) = transpose(vec(1 + dimension(1)*dimension(2) + (i - 1)*dimension(3):dimension(1)*dimension(2) + i*dimension(3)));
end
