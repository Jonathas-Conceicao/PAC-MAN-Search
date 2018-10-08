PY=python2
MAIN:=pacman.py

AGENT=
LAYOUT=
SPEED?=--frameTime 0

.PHONY: all play clean

all:
	make lOpenM aDFS play
	make lOpenM aBFS play
	make lMediumDottedM aUCS play

play:
	$(PY) $(MAIN) $(LAYOUT) $(AGENT) $(SPEED)

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

aDFS:
	$(eval AGENT=-p SearchAgent -a fn=depthFirstSearch)

aBFS:
	$(eval AGENT=-p SearchAgent -a fn=breadthFirstSearch)

aUCS:
	$(eval AGENT=-p SearchAgent -a fn=uniformCostSearch)

clean:
	rm -f *.pyc
