
#include <netinet/in.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <unistd.h>
#include <signal.h>
#include <sys/stat.h>
#include <stdbool.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <dirent.h>
#include <errno.h>


#define BUFSIZE 512
enum TypeFichier { NORMAL, REPERTOIRE, ERREUR };

const char* OK200 = "HTTP/1.1 200 OK\r\n\r\n";
const char* ERROR403 = "HTTP/1.1 403 Forbidden\r\n\r\nAccess denied\r\n";
const char* ERROR404 = "HTTP/1.1 404 Not Found\r\n\r\nFile or directory not found\r\n";

const char *OK_HEADER = "HTTP/1.1 200 OK\nContent-Type: text/html\n\n";

/* Fonction typeFichier()
 * argument: le nom du fichier
 * rend une valeur de type enumeration delaree en tete du fichier
 * NORMAL, ou REPERTOIRE ou ERRREUR
 */
enum TypeFichier typeFichier(char *fichier) {
  struct stat status;
  int r;

  r = stat(fichier, &status);
  if (r < 0)
    return ERREUR;
  if (S_ISREG(status.st_mode))
    return NORMAL;
  if (S_ISDIR(status.st_mode))
    return REPERTOIRE;
  /* si autre type, on envoie ERREUR (a fixer plus tard) */
  return ERREUR;
}


/* envoiFichier()
 * Arguments: le nom du fichier, la socket
 * valeur renvoyee: true si OK, false si erreur
 */
#define BUSIZE 1048;
bool envoiFichier(char *fichier, int soc) {
	int error, fd;
	char buf[BUFSIZE];
	ssize_t nread;
	char *response;

	/* A completer.
	 * On peut se poser la question de savoir si le fichier est
	 * accessible avec l'appel systeme access();
	 * Si oui, envoie l'entete OK 200 puis le contenu du fichier
	 * Si non, envoie l'entete ERROR 403
	 *
	 * Note: le fichier peut etre plus gros que votre buffer,
	 * de meme il peut etre plus petit...
	 */
	error = access(fichier, F_OK); /* F_OK - check existence, R_OK - read permission, W_OK write permission */
	if (error == 0){
		fd = open(fichier, O_RDONLY); /* open for reading mode */
	
		if (fd == -1) {
			perror("error open");
			exit(1);
		}
		// read file content
		nread = read(fd, buf, BUFSIZE);
		if (nread == 0) {
			close(fd);
		}
				
		response = (char *) malloc(sizeof(OK_HEADER) + sizeof(buf));
		strcpy(response, OK_HEADER);
		strcat(response, buf);

		write(soc, response, strlen(response));
	} else {
		if (errno == ENOENT) 
   			printf ("%s does not exist\n", fichier);
  		else if (errno == EACCES) 
   			printf ("%s is not accessible\n", fichier);
		write(soc, ERROR404, strlen(ERROR404));
	}	
	return true;
}


/* envoiRep()
 * Arguments: le nom du repertoire, la socket
 * valeur renvoyee: true si OK, false si erreur
 */
bool envoiRep(char *rep, int soc) {
	DIR *dp;
	struct dirent *pdi;
	char buf[1024], nom[1024];

	dp = opendir(rep);
	if (dp == NULL)
		return false;

	write(soc, OK200, strlen(OK200));
	sprintf(buf, "<html><title>Repertoire %s</title><body>", rep);
	write(soc, buf, strlen(buf));

	while ((pdi = readdir(dp)) != NULL) {
		/* A completer
		 * Le nom de chaque element contenu dans le repertoire est retrouvable a
		 * l'adresse pdi->d_name. Faites man readdir pour vous en convaincre.
		 * Dans un premier temps, on se contentera de la liste simple.
		 * Dans une petite amelioration on poura prefixer chaque element avec
		 * l'icone folder ou generic en fonction du type du fichier.
		 * (Tester le nom de l'element avec le chemin complet.) */
		write(soc, pdi->d_name, strlen(pdi->d_name));
		write(soc, "\n", 1);	
	}
	write(soc, "\n\r", 2);
	return true;
}


void communication(int soc, struct sockaddr *from, socklen_t fromlen) {
	/* int s; */
	char buf[BUFSIZE];
	ssize_t nread;
	/*char host[NI_MAXHOST];*/
	/*bool result;*/
	char *pf;
	enum op { GET, PUT } operation;
	int current_file_type;
	char *redirect_page = "index.html";
	
	/* Eventuellement, inserer ici le code pour la reconnaissance de la
	 * machine appelante */


	/* Reconnaissance de la requete */
	nread = read(soc, buf, BUFSIZE);
	/*printf("%s\n", buf);*/
	if (nread > 0) {
		if (strncmp(buf, "GET", 3) == 0){
			operation = GET;
		} else if (strncmp(buf, "PUT", 3) == 0){
			operation = PUT;
		}
	} else {
		perror("Erreur lecture socket");
		return;
	}

	switch (operation) {
		case GET:
			printf("get\n");
			pf = strtok(buf + 4, " ");
			/* On pointe alors sur le / de "GET /xxx HTTP...
			 * strtok() rend l'adresse du premier caractere
			 * apres l'espace et termine le mot par '\0'
			 */
			pf++; /* pour pointer apres le slash */
			/* pf pointe sur le nom du fichier suivant le / de la requete.
			 * Si la requete etait "GET /index.html ...", alors pf pointe sur
			 * le "i" de "index.html"
			 */
			/* si le fichier est un fichier ordinaire, on l'envoie avec la fonction
			 * envoiFichier().
			 * Si c'est un repertoire, on envoie son listing avec la fonction
			 * envoiRep().
			 * Vous pouvez utiliser la fonction typeFichier() ci-dessous pour tester
			 * le type du fichier.
			 */

			/************ A completer ici**********/
			printf("pf: %s\n", pf);
			current_file_type =  (int)typeFichier(pf);
			printf("enum: %d\n", current_file_type);
			switch(current_file_type){
				case 0: /* FICHIER */
					envoiFichier(pf, soc);
					break;
				case 1: /* REP */
					envoiRep(pf, soc);
					break;
				case 2: /* ERREUR */
					/*envoiFichier(redirect_page, soc);*/
					break; 			
			}
			break;
		case PUT:
			printf("put\n");
			break;
		default:
			printf("unknown\n");
	}

	close(soc);
}

void handle_zombie(int signo){
	wait(NULL);
}

int main(int argc, char **argv) {
	int sfd, s, ns, r, pid;
	struct addrinfo hints;
	struct addrinfo *result, *rp;
	struct sockaddr_storage from;
	socklen_t fromlen;
	char host[NI_MAXHOST];
	/* char buf[BUFSIZE]; */
	/* ssize_t nread, nwrite; */

	if (argc != 2) {
		printf("Usage: %s  port_serveur\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	/* Inserer ici le code d'un serveur TCP concurent */
	memset(&hints, 0, sizeof(struct addrinfo));
	hints.ai_family = AF_INET6;
	hints.ai_socktype = SOCK_STREAM;
	hints.ai_flags = AI_PASSIVE|AI_V4MAPPED|AI_ALL;
	hints.ai_protocol = 0;

	s = getaddrinfo(NULL, argv[1], &hints, &result);
	if (s != 0) {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
		exit(EXIT_FAILURE);
	}

	for(rp = result; rp != NULL; rp = rp->ai_next){
		sfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
		if (sfd == -1) continue;
		r = bind(sfd, rp->ai_addr, rp->ai_addrlen);
		if (r == 0) break;
		close(sfd);
	}

	if (rp == NULL){
		perror("bind error");
		exit(EXIT_FAILURE);
	}

	freeaddrinfo(result);

	listen(sfd, 0);

	while(true){

		fromlen = sizeof(from);
		ns = accept(sfd, (struct sockaddr *) &from, &fromlen);
		if (ns == -1){
			perror("accept error");
			exit(EXIT_FAILURE);	
		}

		s = getnameinfo((struct sockaddr *)&from, fromlen, host, NI_MAXHOST, NULL, 0, NI_NUMERICHOST);
		if (s == 0)
			printf("=====\n");
		printf("Debut avec client '%s'\n", host);

		pid = fork();

		switch(pid){
			case -1:
				continue;
			case 0:
				close(sfd);
				/* for (;;) {
				   nwrite = write(ns, message, strlen(message));
				   if (nwrite < 0) {
				   perror("write");
				   break;
				   } */

				/* nread = read(ns, buf, BUFSIZE);
				   if (nread == 0) {
				   printf("Fin avec client '%s'\n=====\n", host);
				   break;
				   } else if (nread < 0) {
				   perror("read");
				   break;
				   }
				   buf[nread] = '\0';
				   printf("%s\n", buf); 

				   } */
				communication(ns, (struct sockaddr *)&from, fromlen);
				exit(0);
			default:
				signal(SIGCHLD, handle_zombie);
				close(ns);
		}
	}
}
