#! /router/bin/python-2.7.1

import os
import sys



def main():
    if len(sys.argv) == 2:
        file = sys.argv[1]
    else:
        file = "build/make-lib/mcp_ios_precommit.mk"
    
    if not os.path.exists(file):
        sys.exit("%s: File does not exists" % file)
    
    fh = open(file, "r")
    
    prev_line_complete = True
    cmd_lines = [ ]
    
    for line in fh:
        line = line.rstrip('\n')
    
        if prev_line_complete: 
            if cmd_lines:
                print_cmd(cmd_lines)

            if line.startswith('\t'):
                cmd_lines = [ line ]
            else:
                cmd_lines = []
                print line

        else:
            if cmd_lines:
                cmd_lines.append(line)
            else:
                print line

        prev_line_complete = not line.endswith('\\')

    if cmd_lines:
        print_cmd(cmd_lines)

    fh.close()


def print_cmd(cmd_lines):
   
    cmd = ""
    for line in cmd_lines:
        if line.endswith('\\'):
            cmd = cmd + line[:-1]
        else:
            cmd = cmd + line

    cmd.replace('\'', '')
    cmd = ' '.join(cmd.split())

    print "\t@echo 'BUILD_CMD: %s START: '`date`" % cmd
    for line in cmd_lines:
        print line
    print "\t@echo 'BUILD_CMD: %s END: '`date`" % cmd




if __name__ == '__main__':
    main()



