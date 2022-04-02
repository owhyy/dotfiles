// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", "battery", 10, 13},
    {"", "memory", 10, 14},
    {"", "cpu", 10, 18},
    {"", "disk", 3000, 15},
    {"", "volume", 0, 10},
    {"", "sb_time", 60, 1},
    {"", "layout", 0, 30}};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
