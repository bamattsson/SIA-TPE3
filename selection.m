% k = selectionAmount
% m = preSelectionAmount(deterministic tournament)
% t = temperatura (Boltzmann)

function selectIndiv = selection(individualsAmount, individuals, fitness, selectionMode, k, m, t)
  switch(selectionMode)
    case 'elite'
      selectedIndiv = selectionElite(individualsAmount, individuals, fitness, k);
    case 'detTournament'
      selectedIndiv = selectionDeterministicTournament(individualsAmount, individuals, fitness, m, k);
    case 'probTournament'
      selectedIndiv = selectionProbabilisticTournament(individualsAmount, individuals, fitness, k);
    case 'roulette'
      selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k, selectionMode);
    case 'universal'
      selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k, selectionMode); 
    case 'boltzmann'
      %ver si calculamos la temperatura de acuedo a la generación o qué onda
      selectIndiv = selectionBoltzmann(individualsAmount, individuals, fitness, k, t);
    otherwise 
      disp('error in selection mode');
   end 
end