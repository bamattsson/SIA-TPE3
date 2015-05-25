function eliteSelection = selectionElite(individualsAmount, individuals, fitness, selectionAmount)
  max = zeros(1,selectionAmount);
  max(1,:)=-1;
  done= 0;
  
  for i=1:individualsAmount
    done=0;
    for j=1:selectionAmount
      if((max(j) == -1 || fitness(i)> fitness(max(j))) && ~done)
        max(j)=i;
        done=1;
      end
    end
  end
  for i=1:selectionAmount
    eliteSelection{i} = individuals{max(i)};
  end
end