#include <unistd.h>
#include <stdio.h>


int main(int argc, char **argv){

	extern char **environ;

	int i = 0;

	while(environ[i]) {
	  printf("%s\n", environ[i++]);
	}

}


