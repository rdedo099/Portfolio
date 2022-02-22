#Course: ITI 1120
#Assignment 5 Part 2
#de Domenico, Riley
#0300016694

class Point:
    'class that represents a point in the plane'

    def __init__(self, xcoord=0, ycoord=0):
        ''' (Point,number, number) -> None
        initialize point coordinates to (xcoord, ycoord)'''
        self.x = xcoord
        self.y = ycoord        

    def setx(self, xcoord):
        ''' (Point,number)->None
        Sets x coordinate of point to xcoord'''
        self.x = xcoord

    def sety(self, ycoord):
        ''' (Point,number)->None
        Sets y coordinate of point to ycoord'''
        self.y = ycoord

    def get(self):
        '''(Point)->tuple
        Returns a tuple with x and y coordinates of the point'''
        return (self.x, self.y)

    def move(self, dx, dy):
        '''(Point,number,number)->None
        changes the x and y coordinates by dx and dy'''
        self.x += dx
        self.y += dy

    def __eq__(self, other):
        '''(Point,Point)->bool
        Returns True if self and other have the same coordinates'''
        return self.x == other.x and self.y == other.y
    def __repr__(self):
        '''(Point)->str
        Returns canonical string representation Point(x, y)'''
        return 'Point('+str(self.x)+','+str(self.y)+')'
    def __str__(self):
        '''(Point)->str
        Returns nice string representation Point(x, y).
        In this case we chose the same representation as in __repr__'''
        return 'Point('+str(self.x)+','+str(self.y)+')'


class Rectangle:
    'class that represents the rectangle'

    def __init__(self, left, right, color):
        ''' (Rectangle,Point,Point,str) -> None
        initialize the top right and bottom left points of the rectangle)'''
        color=str(color)
        self.left=left
        self.right=right
        self.color=str(color)
    def __str__(self):
        ''' (Rectangle) -> str
        Returns nice string representation'''
        return 'I am a '+self.color+' rectangle with bottom left corner at '+str(self.left)+' and top right corner at '+str(self.right)+'.'
    def __repr__(self):
        ''' (Rectangle) -> str
        Returns nice string representation'''
        return 'Rectangle('+str(self.left)+', '+str(self.right)+', '+'\''+self.color+'\''+')'
    def __eq__(self, other):
        '''(Rectangle,Rectangle)->bool
        Returns True if self and other have the same coordinates'''
        top =self.right
        bot=self.left
        top2=other.right
        bot2=other.left
        return bot==bot2 or top==top2 or bot==top2 or top==bot2
    def get_bottom_left(self):
        '''(Rectangle)->Point
        returns the bottom left point'''
        return self.left
    def get_top_right(self):
        '''(Rectangle)->Point
        returns the top right point'''
        return self.right
    def get_color(self):
        '''(Rectangle)->str
        returns the color of the rectangle'''
        return self.color
    def get_perimeter(self):
        '''(Rectangle)->int
        returns the perimeter of the rectangle'''
        bot = self.left
        top = self.right
        length = top.x - bot.x
        height = top.y - bot.y
        return (2*length)+(2*height)
    def get_area(self):
        '''(Rectangle)->int
        returns the area of the rectangle'''
        bot = self.left
        top = self.right
        length = top.x - bot.x
        height = top.y - bot.y
        return length*height
    def move(self,x,y):
        '''(Rectangle,number,number)->None
        moves the rectangle by x and y'''
        Point.move(self.left,x,y)
        Point.move(self.right,x,y)
    def intersects(self, other):
        '''(Rectangle, Rectangle)->bool
        returns true if the rectangles intersect, returns false otherwise'''
        top=other.right
        bot=other.left
        length = top.x
        height = top.y
        i=length
        o=height
        while (i >=(float(bot.x))):
            i=round(i-0.1,1)
            if(self.contains(i,self.left.y) or (self.contains(i,self.right.y))):
                return True
        return False
            
        return 
    def reset_color(self, new):
        '''(Rectangle,str)->None
        changes the color of the rectangle'''
        self.color=new
    def contains(self,x,y):
        '''(Rectangle,number,number)->None
        returns true if a point is in a rectangle, and false otherwise'''
        top=self.right
        bot=self.left
        length = top.x
        height = top.y
        i=length
        o=height

        while (i >=(float(bot.x))):
            i=round(i-0.1,1)
            if (i==x):
                while (o >=float(bot.y)):
                    o=round(o-0.1,1)
                    if (i==x and o==y):
                        return True
        return False

    
class Canvas:
    'class that represents a canvas of all the rectangles'

    def __init__(self):
        '''(Canvas)->None
        initializes the Canvas'''
        listr=[]
        self.canv=listr
    def __repr__(self):
        '''(Canvas)->str
        returns nice string representation'''
        return 'Canvas('+str(repr(self.canv))+')'
    def __len__(self):
        '''(Canvas)->int
        returns length of list'''
        return len(self.canv)
    def add_one_rectangle(self, rectangle):
        '''(Canvas,Rectangle)->None
        adds a rectangle to a Canvas'''
        self.canv.append(rectangle)
    def count_same_color(self,color):
        '''(Canvas, str)->int
        returns how many rectangles have the same color as the input'''
        rect = self.canv
        count = 0
        for i in range(len(rect)):
            if(color == rect[i].color):
                count = count+1
        return count
    def total_perimeter(self):
        '''(Canvas)->int
        returns the total perimeter of all rectangles in the Canvas'''
        rect = self.canv
        perm = 0
        for i in range(len(rect)):
            perm = perm + rect[i].get_perimeter()
        return perm
    def min_enclosing_rectangle(self):
        '''(Canvas)->Rectangle
        determines a rectangle that could encompass all beings within the Canvas'''
        rect = self.canv
        maxx=0
        minx=0
        maxy=0
        miny=0
        for i in range(len(rect)):
            if (rect[i].left.x<minx):
                minx=rect[i].left.x
            if (rect[i].left.y<miny):
                miny=rect[i].left.y
            if (rect[i].right.x>maxx):
                maxx=rect[i].right.x
            if (rect[i].right.y>maxy):
                maxy=rect[i].right.y
        r=Rectangle(Point(minx,miny),Point(maxx,maxy),"blue")
        return r
    def common_point(self):
        '''(Canvas)->bool
        returns True if all rectangles in the Canvas share a common point'''
        rect=self.canv
        for i in range(len(rect)):
            for x in range(1,len(rect)):
                if (not(rect[i].intersects(rect[x]))):
                    return False
        return True
        
    
            
                
            
            
    
    
    


    
    


    

