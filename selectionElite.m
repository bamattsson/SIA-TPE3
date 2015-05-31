function eliteSelection = selectionElite(individualsAmount, individuals, fitness, selectionAmount)
  maximum = zeros(1,selectionAmount);
  maximum(1,:)=-1;
  done= 0;
  
  for i=1:individualsAmount
    done=0;
    for j=1:selectionAmount
      if(maximum(j)==-1 && ~done)
        done=1;
        maximum(j)=i;
      elseif(maximum(j)~=-1 && fitness(i) > fitness(maximum(j)) && ~done)
        maximum(j+1:end)=maximum(j:end-1);
        maximum(j)=i;
        done=1;
      end
    end
  end
  for i=1:selectionAmount
    eliteSelection{i} = individuals{maximum(i)};
  end
end