function [vec,dimensions] = cellToVector(individual)

	%TODO change if we have to change dimensions
	rows1 = size(individual{1},1);
	cols1 = size(individual{1},2);
	rows2 = size(individual{2},1);
	cols2 = size(individual{2},2);
	%el último set de pesos siempre tiene una fila, el primero lo pusimos por columnas (2)
	vec = [individual{1}(:,1);individual{1}(:,2); individual{2}(1,:)']';
	dimensions = [rows1 cols1 rows2 cols2]
end