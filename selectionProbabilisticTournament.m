function winners = selectionProbabilisticTournament(individualsAmount, individuals, fitness,k)
  m=2;
  threshold = 0.75;
  
  for j=1:k
    max=-1;
    for i=1:m
        chosenForTourn(i) = ceil(rand()*individualsAmount);
    end
    r = rand();    
    for i=1:m
      if(max == -1 || fitness(chosenForTourn(i))> fitness(max))
        max=i;
      end
    end    
    if(r<threshold)
      %disp('winner');
      %disp(max);
      winners{j}=individuals{max};
    else
      %disp('winner');
      %disp(mod(max,2)+1);
      winners{j}=individuals{mod(max,2)+1};
    end
  end  
  
end