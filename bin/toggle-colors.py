#!/usr/bin/env python3

import re

FILE_NAME="/Users/dimtion/.config/alacritty/alacritty.yml"

ENABLED_START = r"^## START (DARK|LIGHT): ON"
DISABLED_START = r"^## START (DARK|LIGHT): OFF"
END = r"^## END (DARK|LIGHT)"

ENABLE = (r"OFF", "ON")
DISABLE = (r"ON", "OFF")

def main():
    enabled_color = []  ## (start, end)
    disabled_color = []  ## (start, end)
    state = 0  # 0: outside, 1: in (previously) enabled, 2: in (previously) disabled
    buffer = []
    with open(FILE_NAME) as config_file:
        for i, line in enumerate(config_file):
            buffer.append(line)
            if re.match(ENABLED_START, line):
                if state != 0:
                    print("Error parsing alacritty config file, aborting. line:", i+1, "state: ", state)
                    return 1
                enabled_color = [i, None]
                state = 1
            elif re.match(DISABLED_START, line):
                if state != 0:
                    print("Error parsing alacritty config file, aborting. line:", i+1, "state: ", state)
                    return 1
                disabled_color = [i, None]
                state = 2
            elif re.match(END, line):
                if state == 0:
                    print("Error parsing alacritty config file, aborting. line:", i+1, "state: ", state)
                elif state == 1:
                    enabled_color[1] = i
                elif state == 2:
                    disabled_color[1] = i
                state = 0

    if not enabled_color or not disabled_color:
        print("Could not find colors starts and ends")
        return 1

    
    print(enabled_color)
    print(disabled_color)

    with open(FILE_NAME, "w+") as f:
        for i, line in enumerate(buffer):
            if state == 0:
                if i == enabled_color[1] or i == disabled_color[1]:
                    ## TODO: revert file to original
                    print("Error parsing file not in state 1 or 2", i)
                elif i == enabled_color[0]:
                    line = re.sub(*DISABLE, line)
                    state = 1
                elif i == disabled_color[0]:
                    line = re.sub(*ENABLE, line)
                    state = 2
            elif state == 1:
                if i == enabled_color[1]:
                    state = 0
                elif i == disabled_color[1]:
                    print("Error parsing file disabled_color", i)
                else:
                    line = "## " + line
            elif state == 2:
                if i == enabled_color[1]:
                    print("Error parsing file, enabled_color", i)
                elif i == disabled_color[1]:
                    state = 0
                else:
                    line = re.sub("## ", "", line)
            f.write(line)


    return 0


if __name__ == "__main__":
    exit(main())
    

