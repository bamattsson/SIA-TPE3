function [individual] = vectorToCell(vec, dimension)
%TODO: change if there are more layers

individual{1} = zeros(dimension(1), dimension(2));
individual{2} = zeros(dimension(3), dimension(4));
individual{3} = zeros(dimension(5), dimension(6));

for i=1:dimension(2);
  individual{1}(:,i) = transpose(vec(1 + (i - 1)*dimension(1):i*dimension(1)));
end

for i=1:dimension(4);
  individual{2}(:,i) = transpose(vec(1 + dimension(1)*dimension(2) + (i - 1)*dimension(3):dimension(1)*dimension(2) + i*dimension(3)));
end

for i=1:dimension(6);
  individual{3}(:,i) = transpose(vec(1 + dimension(1)*dimension(2) + dimension(3)*dimension(4) + (i - 1)*dimension(5):dimension(1)*dimension(2) + dimension(3)*dimension(4) + i*dimension(5)));
end
