# SIA-TPE4

##Instrucciones para ejecutar

En octave, ejecutar el archivo "genetic.m".

###Parámetros modificables

Se pueden modificar varios parámetros para correr el algoritmo genético, para ello se debe modificar el archivo /csv/init.csv
Este archivo contiene los valores de las variables que se quieren modificar en formato csv.
Las variables son:

replacementMode: Se trata del método de reemplazo
	1: Método de reemplazo 1
	2: Método de reemplazo 2
	3: Método de reemplazo 3

individualsAmount: Se trata del tamaño de la población

selectionAmount: Se trata del número de progenitores seleccionados (para los métodos de reemplazo 2 y 3)

maxGenerations: Número máximo de generaciones

mutationProbability: Probabilidad de mutación

selectionMode: Se trata del criterio de selección
	1: Elite
	2: Torneo determinístico
	3: Torneo probabilístico
	4: Ruleta
	5: Universal
	6: Boltzman
	7: Mixto

replacementCriteria: Se trata del criterio de reemplazo
	1: Elite
	2: Torneo determinístico
	3: Torneo probabilístico
	4: Ruleta
	5: Universal
	6: Boltzman
	7: Mixto

secondSelectionMode: Se trata del segundo criterio de selección, se utiliza cuando el primer criterio de selección es Mixto.
	1: Ruleta
	2: Universal

secondReplacementCriteria: Se trata del segundo criterio de reemplazo, se utiliza cuando el primer criterio de selección es Mixto.
	1: Ruleta
	2: Universal	

crossMode: Se trata del método de cruce
	1: Clásico (un solo punto)
	2: Cruce de dos puntos
	3: Cruce uniforme
	4: Cruce anular

Ejemplo:
	replacementMode, 1
	individualsAmount, 10
	selectionAmount, 7
	maxGenerations, 100
	mutationProbability, 0.2
	selectionMode, 1
	replacementCriteria, 1
	secondSelectionMode, 1
	secondReplacementCriteria, 1
	crossMode, 4


