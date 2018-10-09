# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util
from random import randint

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()

class RandomQueue(util.Queue):
    def pop(self):
        return self.list.pop(randint(0, len(self.list) -1))

def tinyMazeSearch(problem):
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    from game import Directions
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

def depthFirstSearch(problem):
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:
    """

    def findPath(problem, # To get methods
                 path,    # To store resulting path
                 states,  # Explored states
                 curr):   # Current state
        if problem.isGoalState(curr):
            return True
        alternatives = problem.getSuccessors(curr)
        for alt in alternatives:
            if not alt[0] in states.list: # Skip explored states
                states.push(alt[0])
                ok = findPath(problem, path, states, alt[0])
                if ok:
                    path.push(alt[1])
                    return ok
                pass
            pass
        return False # Indicates That this paths leads to nowhere

    start = problem.getStartState()
    path = util.Queue()
    states = util.Stack()
    states.push(start)
    findPath(problem, path, states, start)
    return path.list

def breadthFirstSearch(problem):
    """Search the shallowest nodes in the search tree first."""

    def findPath(problem, # To get methods
                 path,    # To store resulting path
                 queue,   # Explorring queue
                 states,  # Explored states
                 curr):   # Current state
        if problem.isGoalState(curr):
            return path
        alternatives = problem.getSuccessors(curr)
        for alt in alternatives:
            if not alt[0] in states.list: # Skip explored states
                states.push(alt[0])
                npath = util.Stack()
                npath.list = list(path.list)
                npath.push(alt[1])
                queue.push((alt[0], # The queue holds the next state to explore  
                            npath)) # and also the path used to get to this point
                pass
            pass

        (q, npath) = queue.pop()
        return findPath(problem, npath, queue, states, q)

    start = problem.getStartState()
    path = util.Stack() # Using a stack because it inserts in the tail
    queue = util.Queue()
    states = util.Stack()
    states.push(start)
    path = findPath(problem, path, queue, states, start)
    return path.list

def uniformCostSearch(problem):
    """Search the node of least total cost first."""

    def findPath(problem, # To get methods
                 path,    # To store resulting path
                 queue,   # Explorring queue
                 states,  # Explored states
                 curr):   # Current state
        if problem.isGoalState(curr):
            return path
        alternatives = problem.getSuccessors(curr)
        for alt in alternatives:
            if not alt[0] in states.list: # Skip explored states
                states.push(alt[0])
                npath = util.Stack()
                npath.list = list(path.list)
                npath.push(alt[1])
                queue.push((alt[0], # The queue holds the next state to explore  
                            npath)) # and also the path used to get to this point
                pass
            pass
        (q, npath) = queue.pop()
        return findPath(problem, npath, queue, states, q)

    start = problem.getStartState()
    path = util.Stack() # Using a stack because it inserts in the tail
    queue = util.PriorityQueueWithFunction(lambda s:problem.getCostOfActions(s[1].list))
    states = util.Stack()
    states.push(start)
    path = findPath(problem, path, queue, states, start)
    return path.list

def nullHeuristic(state, problem=None):
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem, heuristic=nullHeuristic):
    """Search the node that has the lowest combined cost and heuristic first."""

    def findPath(problem, # To get methods
                 path,    # To store resulting path
                 queue,   # Explorring queue
                 states,  # Explored states
                 curr):   # Current state
        if problem.isGoalState(curr):
            return path
        alternatives = problem.getSuccessors(curr)
        for alt in alternatives:
            if not alt[0] in states.list: # Skip explored states
                states.push(alt[0])
                npath = util.Stack()
                npath.list = list(path.list)
                npath.push(alt[1])
                queue.push((alt[0], # The queue holds the next state to explore  
                            npath)) # and also the path used to get to this point
                pass
            pass
        (q, npath) = queue.pop()
        return findPath(problem, npath, queue, states, q)

    start = problem.getStartState()
    path = util.Stack() # Using a stack because it inserts in the tail
    queue = util.PriorityQueueWithFunction(lambda s:heuristic(s[0], problem))
    states = util.Stack()
    states.push(start)
    path = findPath(problem, path, queue, states, start)
    return path.list

def hillClimbing(problem, heuristic=nullHeuristic):

    def findPath(problem, # To get methods
                 path,    # To store resulting path
                 states,  # Explored states
                 curr):   # Current state
        if problem.isGoalState(curr):
            return path
        fila = util.PriorityQueueWithFunction(lambda t:heuristic(t[0], problem))
        alternatives = problem.getSuccessors(curr)
        for alt in alternatives:
            if not alt[0] in states.list: # Skip explored states
                states.push(alt[0])
                npath = util.Stack()
                npath.list = list(path.list)
                npath.push(alt[1])
                fila.push((alt[0],
                           npath))
                pass
            pass
        if not fila.isEmpty():
            q, npath = fila.pop()
            return findPath(problem, npath, states, q)
        return path

    start = problem.getStartState()
    path = util.Stack() # Using a stack because it inserts in the tail
    states = util.Stack()
    states.push(start)
    path = findPath(problem, path, states, start)
    return path.list

def simulatedAnnealing(problem, heuristic=nullHeuristic):

    def findPath(problem, # To get methods
                 path,    # To store resulting path
                 states,  # Explored states
                 curr,    # Current state
                 i):      # Interations count
        if problem.isGoalState(curr) or i == 0:
            return (True, path)
        fila = RandomQueue()
        alternatives = problem.getSuccessors(curr)
        for alt in alternatives:
            if not alt[0] in states.list: # Skip explored states
                states.push(alt[0])
                npath = util.Stack()
                npath.list = list(path.list)
                npath.push(alt[1])
                fila.push((alt[0],
                           npath))
                pass
            pass

        while not fila.isEmpty(): # For each local neighbors
            q, npath = fila.pop()
            if heuristic(q, problem) <= heuristic(curr, problem): # If valid answear is found, return
                ok, rpath = findPath(problem, npath, states, q, i-1) # Try to find path
                return ok, rpath
        return (False, path) # Have not found the a valid answear

    start = problem.getStartState()
    path = util.Stack()
    states = util.Stack()
    states.push(start)
    _, path = findPath(problem, path, states, start, 800)
    return path.list

# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
hcs = hillClimbing
sas = simulatedAnnealing
