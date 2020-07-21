#!/usr/bin/env python

import sys, getopt
import os
import shutil
import glob
import commands

# Graphics
from Tkinter import *
import tkFont

# Some globals
SCRIPTNAME=sys.argv[0]
# TEMPDIR=".findlibs.temp"
SOOUTPUT="solibs.tmp"
FORCECLEAN=0
SYSTEMSOLIBS="systemsolibs.tmp"
SOPATTERN="obj-x86"
DEBUG=0
DELETETMP=1
LIBSVISITED=0
TOTALSOLIBS=0
TOTALSYSTEMSOLIBS=0

# Graphics
REC_WIDTH=300
REC_HEIGHT=30
SPACER_WIDTH=20
SPACER_HEIGHT=100
DRAW_GRAPH=0
ORIG_CANVAS_W=1200
ORIG_CANVAS_H=800
griddb={}
pos_griddb={}
# 0: parent level > child, 1: < 2: ==
colors=["blue", "red", "black"]

# Global database (dictionary indexed by library path)
database={}

# so list
solist=[]

# system so list
systemsolist=[]

# system libs
systemdb={}

# notfound libs
notfounddb={}

# duplicate libs
dupdb={}

class depnode:
    def __init__(self, text, level):
        self.text = text
        self.level = level
        self.deplibs={}
        self.rec_width = REC_WIDTH
        self.rec_height = REC_HEIGHT
        self.rec_x = 0
        self.rec_y = 0
        self.fill="grey"
        self.positioned = False
        self.visited = False
    
    def position(self, x, y):
        self.rec_x = x
        self.rec_y = y
        self.positioned = True

    def isvisited(self):
        return self.visited
    
    def setvisited(self):
        self.visited = True
    
    def ispositioned(self):
        return self.positioned
    
    def draw(self, canvas):
        center_x, center_y = self.get_center()
        canvas.create_rectangle(self.rec_x,
                                self.rec_y,
                                self.rec_x + self.rec_width,
                                self.rec_y + self.rec_height,
                                fill=self.fill)
        canvas.create_text(center_x, center_y, text=self.text, font = tkFont.Font(size='8'))

    def get_center(self):
        return (self.rec_x + int(self.rec_width/2),
            self.rec_y + int(self.rec_height/2))

    def get_top_center(self):
        return (self.rec_x + int(self.rec_width/2), self.rec_y)

    def get_bottom_center(self):
        return (self.rec_x + int(self.rec_width/2),
            self.rec_y + self.rec_height)

    def set_level(self, level):
        if level > self.level:
            self.level = level

    def get_level(self):
        return self.level

    def add_deplibs(self, lib, res):
        # Make sure it does not already exist
        if lib in self.deplibs:
            if self.deplibs[lib] == "RESOLVED":
                print ("ERROR - Lib %s already in %s" %(lib, self.text))
                print self.deplibs
                sys.exit(1)
        self.deplibs[lib]=res

    def get_deplibs(self):
        return self.deplibs


def find_files_with_ext(path, ext, outfile):
    COUNT=0
    for root, dirs, files in os.walk(path, followlinks=True):
        for f in files:
            if f.endswith(ext):
                outfile.write("%s\n" %(os.path.join(root, f)))
                COUNT = COUNT + 1
    return COUNT

def echo_usage():
    print ("Usage:")
    print ("  %s <binary-path>" %(SCRIPTNAME))
    print ("     Recursively finds dependent libraries through ldd")
    print ("     Assumes all .so of the project are in file ./%s" %(SOOUTPUT))
    print ("     If the %s file does not exist, it builds it by finding" %(SOOUTPUT))
    print ("     all *.so with '%s' in the path" %(SOOUTPUT))
    print ("  Options:")
    print ("     -d: Turn on Debugs")
    print ("     -f: Force recompute of %s" %(SOOUTPUT))
    print ("     -g: Show dependency graph")
    print ("     -h: print this help")
    print ("     -t: Do not delete .tmp files")
    print ("")
    print ("  Example: %s ipv4/bgp/spkr/obj-x86/bgp" %(SCRIPTNAME))
    print ("")

def print_counter():
    global LIBSVISITED

    if LIBSVISITED > 0:
        sys.stdout.write("\b")
    if LIBSVISITED > 9:
        sys.stdout.write("\b")
    if LIBSVISITED > 99:
        sys.stdout.write("\b")
    if LIBSVISITED > 999:
        sys.stdout.write("\b")
    if LIBSVISITED > 9999:
        sys.stdout.write("\b")
    if LIBSVISITED > 99999:
        sys.stdout.write("\b")
    #increment and print
    LIBSVISITED = LIBSVISITED + 1
    sys.stdout.write ("%d" %(LIBSVISITED))

def find_lib_in_list(lib, tlist):
    res = []
    for t in tlist:
        if lib in t:
            res.append(t)
    return res

def grist_name(lib):
    GRIST = lib
    
    # Remove any leading '../' from the Target name to come up with uniq id
    while GRIST.startswith(".") or GRIST.startswith("/"):
        GRIST = GRIST.lstrip('./')

    return GRIST

# Get the list of .so from a lib/bin
def get_so_list(lib):
    global DEBUG, database, solist, systemsolist, systemdb, notfounddb, dupdb
    
    GRIST = grist_name(lib)
    
    # Show progress 
    if DEBUG == 0:
        print_counter()
    
    # Make sure we have not visited this library before
    if GRIST in database:
        # Update the level
        if DEBUG == 1:
            print ("already visited %s, now level %d... returning"
                %(GRIST, database[GRIST].get_level()))
        return
    
    if DEBUG == 1:
        print ("Handling %s, at level %d" %(lib, level))
    
    # Add lib to database
    database[GRIST] = depnode(GRIST, 0)
    
    res, out = commands.getstatusoutput("ldd " + lib)
    if res != 0:
        print ("Error in ldd for %s" %(lib))
        return
    
    # For each line in the ldd output
    lines = out.split('\n')
    for line in lines:
        # Pick the library from the line
        newlib = line.lstrip().split(' ', 1)[0]
        if DEBUG == 1:
            print ("%s" %(newlib))
        # Find the lib in the so database
        # There could be multiple matches (if so, count as duplicate)
        match = find_lib_in_list(newlib, solist)
        if len(match) == 0:
            # Find the lib in the system so database
            match = find_lib_in_list(newlib, systemsolist)
            if len(match) == 0:
                # Can not find the lib
                notfounddb[newlib] = 1
                database[GRIST].add_deplibs(newlib, "NOT FOUND")
            else:
                # System library
                notfounddb[newlib] = 1
                database[GRIST].add_deplibs(newlib, "SYSTEM")
        else:
            # For each match, recurse
            for m in match:
                m = m.strip("\n")
                if DEBUG == 1:
                    print ("Adding %s to %s" %(m, database[GRIST].text))
                if len(match) > 1:
                    dupdb[m] = 1
                database[GRIST].add_deplibs(m, "RESOLVED")
                get_so_list(m)
    # After visiting all the children, we update this nodes' level
    max_level = 0
    deplibs = database[GRIST].get_deplibs()
    for key in deplibs.keys():
        if deplibs[key] == "RESOLVED":
            grist_key = grist_name(key)
            tmplevel = database[grist_key].get_level()
            if tmplevel > max_level:
                max_level = tmplevel
    database[GRIST].set_level(max_level + 1)

def compute_max_width():
    global database, griddb
    maxwidth = 0
    
    for key in database.keys():
        node = database[key]
        if node.get_level() not in griddb:
            griddb[node.get_level()] = 1
        else :
            griddb[node.get_level()] = griddb[node.get_level()] + 1                
        if griddb[node.get_level()] > maxwidth:
            maxwidth = griddb[node.get_level()]
    return maxwidth

def position_and_draw(canvas, node, maxwidth, maxlevel):
    global griddb, pos_griddb, colors
    if node.get_level() not in pos_griddb:
        # First node to be placed on this level
        level_start = (maxwidth - griddb[node.get_level()])/2
        pos_griddb[node.get_level()] = level_start
    else :
        pos_griddb[node.get_level()] = pos_griddb[node.get_level()] + 1
    X = (REC_WIDTH + SPACER_WIDTH) * pos_griddb[node.get_level()]
    Y = (REC_HEIGHT + SPACER_HEIGHT) * (maxlevel - node.get_level())
    node.position(X, Y)


def draw_line(canvas, node, parent):
    # Draw a line from parent to node
    color = colors[0]
    if parent.get_level() > node.get_level():
        color = colors[1]
    elif parent.get_level() == node.get_level():
        color = colors[2]
    canvas.create_line(parent.get_bottom_center(),
        node.get_top_center(), fill=color, width=1)

def position_nodes_draw_lines(canvas, lib, maxwidth, maxlevel):
    global database, pos_griddb
    
    GRIST = grist_name(lib)
    
    node = database[GRIST]
    if not node.ispositioned():
        position_and_draw(canvas, node, maxwidth, maxlevel)
    
    if node.isvisited():
        # We are done with this node and its children
        return
    
    # Position the children
    deplibs = node.get_deplibs()
    for key in deplibs.keys():
        if deplibs[key] == "RESOLVED":
            grist_key = grist_name(key)
            child_node = database[grist_key]
            if not child_node.ispositioned(): 
                position_and_draw(canvas, child_node,
                    maxwidth, maxlevel)
            # Now that the child is positioned, draw the line
            draw_line(canvas, child_node, node)
    # Mark this node so that we dont see it again
    node.setvisited()
    
    # Now that we positioned all the children, recurse
    deplibs = node.get_deplibs()
    for key in deplibs.keys():
        if deplibs[key] == "RESOLVED":
            position_nodes_draw_lines(canvas, key, maxwidth, maxlevel)

def get_canvas(root, canvas_width, canvas_height):
    root.frame = frame = Frame(root, width=ORIG_CANVAS_W, height=ORIG_CANVAS_H)
    frame.grid(row=0,column=0)
    
    canvas = Canvas(frame, width=ORIG_CANVAS_W, height=ORIG_CANVAS_H)
    frame.canvas = canvas.canvas = canvas
    canvas.config(width=ORIG_CANVAS_W, height=ORIG_CANVAS_H,
        scrollregion=(0, 0, canvas_width, canvas_height))
    
    hbar = Scrollbar(frame, orient=HORIZONTAL)
    hbar.pack(side=BOTTOM, fill=X)
    hbar.config(command=canvas.xview)
    
    vbar=Scrollbar(frame,orient=VERTICAL)
    vbar.pack(side=RIGHT,fill=Y)
    vbar.config(command=canvas.yview)
    
    canvas.config(xscrollcommand=hbar.set, yscrollcommand=vbar.set)
    canvas.pack()
    
    # Set up canvas data
    canvas.data = { }
    canvas.delete(ALL)
    
    return canvas

if __name__ == "__main__":
    
    # Parse command line args
    try:
        opts, args = getopt.getopt(sys.argv[1:],"dfght")
    except getopt.GetoptError:
        echo_usage()
        sys.exit(1)
    for opt, arg in opts:
        if opt == '-d':
            DEBUG=1
        elif opt == '-f':
            FORCECLEAN=1
        elif opt == '-g':
            DRAW_GRAPH=1
        elif opt == '-h':
             echo_usage()
             sys.exit(0)
        elif opt == '-t':
             DELETETMP=0
    
    # We are expecting a single file
    if len(args) != 1:
        echo_usage()
        sys.exit(1)
    
    # Cleanup previous iterations
    # if os.path.isdir(TEMPDIR):
    #    shutil.rmtree(TEMPDIR)
    
    # Check if the file exists
    if not os.path.isfile(args[0]):
        print ("File '%s' does not exist" %(args[0]))
        sys.exit(1)
    
    # Find All .so in current dir
    if (not os.path.isfile(SOOUTPUT)) or (FORCECLEAN == 1):
        # if it exists replace it
        outfile = open(SOOUTPUT, 'w')
        print("Collecting .so files from ./ ...")
        for root, dirs, files in os.walk("./", followlinks=True):
            for f in files:
                if f.endswith(".so") :
                    if SOPATTERN+"/" in root or root.endswith(SOPATTERN):
                        outfile.write("%s\n" %(os.path.join(root, f)))
        outfile.close()
        print ("done")

    # Populate list from file
    solist = open(SOOUTPUT).readlines()
    TOTALSOLIBS = len(solist)

    # Find All .so in system
    if (not os.path.isfile(SYSTEMSOLIBS)) or (FORCECLEAN == 1):
        # if it exists replace it
        outfile = open(SYSTEMSOLIBS, 'w')
        print( "Collecting .so from /usr/lib...")
        find_files_with_ext("/usr/lib", ".so", outfile)
        print( "Collecting .so from /usr/lib64...")
        find_files_with_ext("/usr/lib64", ".so", outfile)
        print( "Collecting .so from lib...")
        find_files_with_ext("/lib", ".so", outfile)
        print( "Collecting .so from /lib64...")
        find_files_with_ext("/lib64", ".so", outfile)
        outfile.close()
        print( "done")

    # Populate list from file
    systemsolist = open(SYSTEMSOLIBS).readlines()
    TOTALSYSTEMSOLIBS = len(systemsolist)

    # Recurse and find all libs
    sys.stdout.write( "Building database for %s..." %(args[0]))
    get_so_list(args[0])

    # Now that we have all the files, gather and print
    print( "")
    print( "Libraries Found :")
    print( "=================")
    for key in database.keys():
        print(key)
    
    print( "")
    print( "System Libraries :")
    print( "==================")
    for key in systemdb.keys():
        print(key)
    
    print( "")
    print( "Libraries Not found:")
    print( "====================")
    for key in notfounddb.keys():
        print(key)
    
    print( "")
    print( "Duplicate Libraries:")
    print( "====================")
    for key in dupdb.keys():
        print(key)
    
    print( "")
    print( "Total libraries from %s: %d" %(SOOUTPUT, TOTALSOLIBS))
    print( "Total libraries from %s: %d" %(SYSTEMSOLIBS, TOTALSYSTEMSOLIBS))
    print( "Total expanded libraries: %d" %(len(database.keys())))
    print( "Total not found libraries: %d" %(len(notfounddb.keys())))
    print( "Total duplicate libraries: %d" %(len(dupdb.keys())))
    print( "Total system libraries: %d" %(len(systemdb.keys())))
    print( "")

    # Compute max depth
    maxlevel = 0
    for key in database.keys():
        if database[key].get_level() > maxlevel:
            maxlevel = database[key].get_level()
    print( "Max depth levels: %d" %(maxlevel))

    # Compute max width
    maxwidth = compute_max_width()
    print( "Max level width: %d" %(maxwidth))

    if DRAW_GRAPH == 1:
        # create the root and the canvas
        root = Tk()
        
        # Compute the canvas size needed
        # For a n x m grid, we need the following size
        canvas_width= (maxwidth*REC_WIDTH) + ((maxwidth+1)*SPACER_WIDTH)
        canvas_height= (maxlevel*REC_HEIGHT) + ((maxlevel+1)*SPACER_HEIGHT)
        canvas = get_canvas(root, canvas_width, canvas_height)

        position_nodes_draw_lines(canvas, args[0], maxwidth, maxlevel);
        # Now draw the nodes so that they apear above the lines
        for key in database.keys():
            database[key].draw(canvas)
            xx, yy = database[key].get_top_center()
            size = 4
            canvas.create_oval(xx-size, yy-size, xx+size, yy+size, fill="white")

        # This call blocks until the window is closed 
        root.mainloop()
    
