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
	make lContoursM aDFS     play
	make lContoursM aBFS     play
	make lContoursM aUCS_S   play
	make lContoursM aUCS_W   play
	make lContoursM aUCS_E   play
	make lContoursM aSTAR_nh play
	make lContoursM aSTAR_eh play
	make lContoursM aSTAR_mh play
	make lContoursM aHCS     play
	make lContoursM aSAS     play

testQuiet:
	@make quiet lContoursM aDFS     play | $(FILTER)
	@make quiet lContoursM aDFS     play | $(FILTER)
	@make quiet lContoursM aBFS     play | $(FILTER)
	@make quiet lContoursM aUCS_S   play | $(FILTER)
	@make quiet lContoursM aUCS_W   play | $(FILTER)
	@make quiet lContoursM aUCS_E   play | $(FILTER)
	@make quiet lContoursM aSTAR_nh play | $(FILTER)
	@make quiet lContoursM aSTAR_eh play | $(FILTER)
	@make quiet lContoursM aSTAR_mh play | $(FILTER)
	@make quiet lContoursM aHCS     play | $(FILTER)
	@make quiet lContoursM aSAS     play | $(FILTER)

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
