#Course: ITI 1120
#Assignment 2 Part 1
#de Domenico, Riley
#0300016694

#import
import random

#functions
def clear():
    '''none->none
       clears the current screen'''
    print('\n'*100)

def buildast(x):
    '''int -> list
       builds a list of astrisk to load and sub into'''
    hold = ""
    for y in range (x):
        hold=hold+"*"
    l=list(hold)
    return l

def read_raw_board(file):
    '''str->list of str
    Returns a list of strings represeniting a deck of cards that was stored in a file. 
    The deck may not necessarifly be playable
    '''
    raw_board = open(file).read().splitlines()
    for i in range(len(raw_board)):
        raw_board[i]=raw_board[i].strip()
    return raw_board
    return check
def shuffle_deck(deck):
    '''(list of str)->None
       Shuffles the given list of strings representing the playing deck    
    '''
    print("\nShuffling deck!\n")
    return random.shuffle(deck)
def print_board(a):
    '''(list of str)->None
       Prints the current board in a nicely formated way
    '''
    for i in range(len(a)):
        print('{0:4}'.format(a[i]), end=' ')
    print()
    for i in range(len(a)):
        print('{0:4}'.format(str(i+1)), end=' ')
def wait_for_player():
    '''()->None
    Pauses the program/game until the player presses enter
    '''
    input("\nPress enter to continue. ")
    print()
def create_board(size):
    '''int->list of str
       Precondition: size is even positive integer between 2 and 52
       Returns a rigorous deck (i.e. board) of a given size.
    '''
    board = [None]*size 

    letter='A'
    for i in range(len(board)//2):
          board[i]=letter
          board[i+len(board)//2 ]=board[i]
          letter=chr(ord(letter)+1)
    return board
def print_revealed(discovered, p1, p2, original_board):
    '''(list of str, int, int, list of str)->None
    Prints the current board with the two new positions (p1 & p2) revealed from the original board
    Preconditions: p1 & p2 must be integers ranging from 1 to the length of the board
    '''
    if (original_board[p1 - 1] == original_board[p2 - 1]):
        original_board[p1 - 1] = discovered
        original_board[p2 - 1] = discovered
        print("Good guess!")           
    else:
        original_board[p1 - 1] = '*'
        original_board[p2 - 1] = '*'
        print("Better luck next time")
    print_board(original_board)
    
def is_rigorous(l):
    '''list of str->True or None
    Returns True if every element in the list appears exactlly 2 times or the list is empty.
    Otherwise, it returns False.

    Precondition: Every element in the list appears even number of times
    '''
    rigorous = True
    for x in range(len(l)-1):
        count = 1
        
        for y in range(len(l)-1):
            if (l[x-1] == l[y-1]):
                count= count + 1
                if (count !=2):
                    rigorous = False
    return rigorous
            

def clean_up_board(l):
    '''list of str->list of str

    The functions takes as input a list of strings representing a deck of cards. 
    It returns a new list containing the same cards as l except that
    one of each cards that appears odd number of times in l is removed
    and all the cards with a * on their face sides are removed
    '''
    print("\nRemoving one of each cards that appears odd number of times and removing all stars ...\n")
    playable_board=[]
    for x in range(len(l)):
        if (l.count(l[x]))%2 != 0:
            l.pop(x)
            l.insert(x,'*')
        elif(l.count(l[x]))%2 == 0 and l[x]!='*':
            playable_board.append(l[x])
 
    
    return playable_board
    
def play_game_rigorous(board):
    '''(list of str)->None
    Plays a concentration game using a generated rigorous deck
    Precondition: board a list representing a playable deck
    '''
    ast=buildast(size)
    guesscount=0
    correct = 0
    
    win = False
    print("Ready to play ...\n")
    while (win == False):
        clear()
        print_board(ast)
        error_fail = True
        while (error_fail==True):
            guess1 = int(input("\nPick the first card by selecting the number below the asterics "))
            if (guess1<=size and guess1>0 and ast[guess1-1]=="*"):
                error_fail = False
        error_fail = True
        while (error_fail==True):
            guess2 = int(input("Pick the second card by selecting the number below the asterics "))
            if (guess2<=size and guess2>0 and ast[guess2-1]=="*" and guess1 != guess2):
                error_fail = False
        ast[guess1-1] = board[guess1-1]
        ast[guess2-1] = board[guess2-1]
        print_board(ast)
        guesscount = guesscount + 1
        if (ast[guess1-1] != ast[guess2-1]):
            ast[guess1-1] = "*"
            ast[guess2-1] = "*"
            print("\nBetter luck next time.")
            wait_for_player()
                                
        else:
            print("\nGood guess!")
            correct = correct + 2
            if (correct == size):
                win = True
                print('Congratulations you have won in '+str(guesscount)+' guesses, this is '+str(int(guesscount-(size/2)))+' guesses away from the optimal amount')
            wait_for_player()
    
def play_game(board):
    '''(list of str)->None
    Plays a concentration game using the given board
    Precondition: board a list representing a playable deck
    '''
    win = False
    size = len(board)
    ast = buildast(size)
    guesscount = 0
    print("Ready to play ...\n")
    while (win == False):
        wincount=0
        clear()
        print_board(ast)
        error_fail = True
        while (error_fail==True):
            guess1 = int(input("\nPick the first card by selecting the number below the asterics "))
            if (guess1<=size and guess1>0 and ast[guess1-1]=="*"):
                error_fail = False
        error_fail = True
        while (error_fail==True):
            guess2 = int(input("Pick the second card by selecting the number below the asterics "))
            if (guess2<=size and guess2>0 and ast[guess2-1]=="*" and guess1 != guess2):
                error_fail = False
        ast[guess1-1] = board[guess1-1]
        ast[guess2-1] = board[guess2-1]
        guesscount = guesscount + 1
        print_revealed(board[guess1-1],guess1,guess2,ast)
        wait_for_player()
        for x in range((size)):
            if (ast[x-1]!='*'):
                wincount= wincount+1
            if(wincount == len(ast)):
                win = True
                print('Congratulations you have won in '+str(guesscount)+' guesses, this is '+str(int(guesscount-(size/2)))+' guesses away from the optimal amount')
                wait_for_player()
                      


#main

print('***************************************\n*                                     *\n*__Welcome to The Concentration Game__*\n*                                     *\n***************************************\n\n\n')
win=False

error_fail = True
while (error_fail == True):
    print('What would you like to play with (Enter 1 or 2 to identify your choice)\n')
    game_mode = int(input("(1) Generated rigorous deck of cards \n(2) Deck loaded from a file\n"))
    if (game_mode==1 or game_mode==2):
        error_fail = False

if(game_mode == 1):
    clear()
    error_fail = True
    while (error_fail == True):
        size = int(input("How many cards would you like (Pick an even integer between 2 and 52)\n"))
        if (size%2==0 and size<=52 and size>2):
            error_fail = False
            clear()
    
    built = create_board(size)
    shuffle_deck(built)

    play_game_rigorous(built)
    

elif(game_mode == 2):
    print("You chose to load a deck of cards from a file")
    file=input("Enter the name of the file: ")
    file=file.strip()
    board=read_raw_board(file)
    board=clean_up_board(board)
    shuffle_deck(board)
    play_game(board)
    
    
            
        
    
        
            
