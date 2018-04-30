#include <stdio.h>

int main(int argc, char *argv[])
{
    char cmd[30] = "/home/app/ptdaemon.sh";
    sleep(1);
    system(cmd);
    
    return 0;
}
