% k = selectionAmount
% m = preSelectionAmount(deterministic tournament)
% t = temperatura (Boltzmann)

function selectIndiv = selection(individualsAmount, individuals, fitness, selectionMode, k, m, t, n1, secondSelectionMode)
  switch(selectionMode)
    case 'elite'
      selectIndiv = selectionElite(individualsAmount, individuals, fitness, k);
    case 'detTournament'
      selectIndiv = selectionDeterministicTournament(individualsAmount, individuals, fitness, m, k);
    case 'probTournament'
      selectIndiv = selectionProbabilisticTournament(individualsAmount, individuals, fitness, k);
    case 'roulette'
      selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k, selectionMode);
    case 'universal'
      selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k, selectionMode); 
    case 'boltzmann'
      %ver si calculamos la temperatura de acuedo a la generación o qué onda
      selectIndiv = selectionBoltzmann(individualsAmount, individuals, fitness, k, t);
    case 'mix'
      selectionMix(individualsAmount, individuals, fitness, k, n1, secondSelectionMode);
    otherwise 
      disp('error in selection mode');
   end 
end