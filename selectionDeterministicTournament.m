function winners = selectionDeterministicTournament(individualsAmount, individuals, fitness, m, k)
  for j=1:k
    max=-1;
    for i=1:m
      chosenForTourn(i) = ceil(rand()*individualsAmount);
    end
   disp('chosenForTourn');
   disp(chosenForTourn);
    for i=1:m
      if(max == -1 || fitness(chosenForTourn(i))> fitness(max))
        max=i;
      end
    end
    disp('winner');
    disp(chosenForTourn(max));
    winners{j}=individuals{max};
  end  
end