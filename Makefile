PY=python2
MAIN:=pacman.py

QUIET  =
AGENT  =
LAYOUT =
EFLAGS =
ZOOM   =-z .5
SPEED? =--frameTime 0

FILTER=grep 'Search nodes' | sed 's,.*: \(.*\),\1,'

.PHONY: test testQuiet
test:
	make lOpenM aDFS play
	make lOpenM aBFS play
	make lMediumM aUCS_S play
	make lMediumScaryM aUCS_W play
	make lMediumDottedM aUCS_E play
testQuiet:
	make quiet lOpenM aDFS play
	make quiet lOpenM aBFS play
	make quiet lMediumM aUCS_S play
	make quiet lMediumScaryM aUCS_W play
	make quiet lMediumDottedM aUCS_E play

.PHONY: play quiet
play:
	$(PY) $(MAIN) $(QUIET) $(ZOOM) $(SPEED) $(LAYOUT) $(AGENT) $(EFLAGS)
quiet:
	$(eval export QUIET=--quietTextGraphics)

.PHONY: lBigM lContoursM lMediumDottedM lMediumM lMediumScaryM lOpenM lSmallM lTestM lTinyM
lBigM:
	$(eval LAYOUT=--layout bigMaze)
lContoursM:
	$(eval LAYOUT=--layout contoursMaze)
lMediumDottedM:
	$(eval LAYOUT=--layout mediumDottedMaze)
lMediumM:
	$(eval LAYOUT=--layout mediumMaze)
lMediumScaryM:
	$(eval LAYOUT=--layout mediumScaryMaze)
lOpenM:
	$(eval LAYOUT=--layout openMaze)
lSmallM:
	$(eval LAYOUT=--layout smallMaze)
lTestM:
	$(eval LAYOUT=--layout testMaze)
lTinyM:
	$(eval LAYOUT=--layout tinyMaze)
#Guilherme add Line
lTestGB1:
	$(eval LAYOUT=--layout testeGuiBig1)
lTestGB2:
	$(eval LAYOUT=--layout testeGuiBig2)
lTestGM1:
	$(eval LAYOUT=--layout testeGuiMediun1)
lTestGM2:
	$(eval LAYOUT=--layout testeGuiMediun2)

.PHONY: aDFS aBFS
aDFS:
	$(eval AGENT=-p SearchAgent -a fn=depthFirstSearch)
aBFS:
	$(eval AGENT=-p SearchAgent -a fn=breadthFirstSearch)

.PHONY: aUCS_S aUCS_E aUCS_W
aUCS_S:
	$(eval AGENT=-p SearchAgent -a fn=uniformCostSearch)
aUCS_E:
	$(eval AGENT=-p StayEastSearchAgent)
aUCS_W:
	$(eval AGENT=-p StayWestSearchAgent)

.PHONY: aSTAR_nh aSTAR_mh aSTAR_eh
aSTAR_nh:
	$(eval AGENT=-p SearchAgent -a fn=astar)
aSTAR_mh:
	$(eval AGENT=-p SearchAgent -a fn=astar,heuristic=manhattanHeuristic)
aSTAR_eh:
	$(eval AGENT=-p SearchAgent -a fn=astar,heuristic=euclideanHeuristic)

.PHONY: aHCS aSAS
aHCS:
	$(eval AGENT=-p SearchAgent -a fn=hillClimbing)
aSAS:
	$(eval AGENT=-p SearchAgent -a fn=simulatedAnnealing)

.PHONY: clean
clean:
	rm -f *.pyc
