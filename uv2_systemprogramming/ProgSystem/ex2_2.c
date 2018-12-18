#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv){
        char *result;
        result = getenv(argv[1]);
        printf("Env %s: %s \n", argv[1], result);

}

