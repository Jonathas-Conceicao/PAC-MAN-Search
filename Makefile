PY=python2
MAIN:=pacman.py

AGENT=
LAYOUT=

.PHONY: all play clean

all: lSmallM aDFS play

play:
	$(PY) $(MAIN) $(LAYOUT) $(AGENT)

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

clean:
	rm -f *.pyc
