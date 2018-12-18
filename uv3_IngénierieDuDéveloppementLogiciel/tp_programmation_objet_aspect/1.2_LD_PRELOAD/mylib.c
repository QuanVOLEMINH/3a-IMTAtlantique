#include <unistd.h>
#include <string.h>

#define MAX_SIZE 200
/* my puts imp */
int puts(const char *s){
	/* add to each call */
	const char header[] = "===>>> My headerrrr\n";
	write(STDOUT_FILENO, header, sizeof(header)-1);

	/* actual string */
	size_t length = strlen(s);
	write(STDOUT_FILENO, s, length);

	const char footer[] = "\n<<<===\n";
	write(STDOUT_FILENO, footer, sizeof(footer)-1);

	return 1;
}

