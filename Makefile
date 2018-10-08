PY=python2
MAIN:=pacman.py

QUIET=
AGENT=
LAYOUT=
EFLAGS=
SPEED?=--frameTime 0

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
	$(PY) $(MAIN) $(LAYOUT) $(AGENT) $(SPEED) $(QUIET) $(EFLAGS)
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

.PHONY: clean
clean:
	rm -f *.pyc
