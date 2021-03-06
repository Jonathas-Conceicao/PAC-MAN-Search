PY=python2
MAIN:=pacman.py

QUIET  =
AGENT  =
LAYOUT =
EFLAGS =
ZOOM   =
SPEED  =

FILTER=grep 'Search nodes' | sed 's,.*: \(.*\),\1,'


.PHONY: test testQuiet
test:
	make lContoursM aDFS    play
	make lContoursM aBFS    play
	make lContoursM aUCS_S  lay
	make lContoursM aUCS_W  play
	make lContoursM aUCS_E  play
	make lContoursM aASS_nh play
	make lContoursM aASS_eh play
	make lContoursM aASS_mh play
	make lContoursM aHCS    play
	make lContoursM aSAS    play

testQuiet:
	@make quiet lContoursM aDFS    play | $(FILTER)
	@make quiet lContoursM aDFS    play | $(FILTER)
	@make quiet lContoursM aBFS    play | $(FILTER)
	@make quiet lContoursM aUCS_S  play | $(FILTER)
	@make quiet lContoursM aUCS_W  play | $(FILTER)
	@make quiet lContoursM aUCS_E  play | $(FILTER)
	@make quiet lContoursM aASS_nh play | $(FILTER)
	@make quiet lContoursM aASS_eh play | $(FILTER)
	@make quiet lContoursM aASS_mh play | $(FILTER)
	@make quiet lContoursM aHCS    play | $(FILTER)
	@make quiet lContoursM aSAS    play | $(FILTER)

.PHONY: play quiet zoom fast
play:
	$(PY) $(MAIN) $(QUIET) $(ZOOM) $(SPEED) $(LAYOUT) $(AGENT) $(EFLAGS)
quiet:
	$(eval QUIET=--quietTextGraphics)
zoom:
	$(eval ZOOM =-z .5)
fast:
	$(eval SPEED =--frameTime 0)

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
lTestGB3:
	$(eval LAYOUT=--layout testeGuiBig3)
lTestGB4:
	$(eval LAYOUT=--layout testeGuiBig4)
lTestGM1:
	$(eval LAYOUT=--layout testeGuiMediun1)
lTestGM2:
	$(eval LAYOUT=--layout testeGuiMediun2)
lTestGM3:
	$(eval LAYOUT=--layout testeGuiMediun3)
lTestGM4:
	$(eval LAYOUT=--layout testeGuiMediun4)
lTestGS1:
	$(eval LAYOUT=--layout testGuiSmall1)
lTestGS2:
	$(eval LAYOUT=--layout testGuiSmall2)
lTestGS3:
	$(eval LAYOUT=--layout testGuiSmall3)
lTestGS4:
	$(eval LAYOUT=--layout testGuiSmall4)
lTestGS5:
	$(eval LAYOUT=--layout testGuiSmall5)

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

.PHONY: aASS_nh aASS_mh aASS_eh
aASS_nh:
	$(eval AGENT=-p SearchAgent -a fn=astar)
aASS_mh:
	$(eval AGENT=-p SearchAgent -a fn=astar,heuristic=manhattanHeuristic)
aASS_eh:
	$(eval AGENT=-p SearchAgent -a fn=astar,heuristic=euclideanHeuristic)

.PHONY: aHCS_nh aHCS_mh aHCS_eh
aHCS_nh:
	$(eval AGENT=-p SearchAgent -a fn=hillClimbing)
aHCS_mh:
	$(eval AGENT=-p SearchAgent -a fn=hillClimbing,heuristic=manhattanHeuristic)
aHCS_eh:
	$(eval AGENT=-p SearchAgent -a fn=hillClimbing,heuristic=euclideanHeuristic)

.PHONY: aSAS_nh aSAS_mh aSAS_eh
aSAS_nh:
	$(eval AGENT=-p SearchAgent -a fn=simulatedAnnealing)
aSAS_mh:
	$(eval AGENT=-p SearchAgent -a fn=simulatedAnnealing,heuristic=manhattanHeuristic)
aSAS_eh:
	$(eval AGENT=-p SearchAgent -a fn=simulatedAnnealing,heuristic=euclideanHeuristic)

.PHONY: clean
clean:
	rm -f *.pyc
