function selectedIndividuals = selectionMix(individualsAmount, individuals, fitness, k, n1,secondSelectionMode)
	s1 = selectionElite(individualsAmount, individuals, fitness, n1);
	s2 =selectIndiv = selectionRouletteUniversal(individualsAmount, individuals, fitness, k-n1, secondSelectionMode);
	selectedIndividuals = [s1,s2];
end