#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 100000

int main(int argc, char **argv) {
	int sfd, s, val, volume;
	struct addrinfo hints;
	struct addrinfo *result, *rp;
	char buf[BUFSIZE];
	ssize_t nsend;
	/* struct in_addr localInterface; */
	struct sockaddr_in groupSock;

	if (argc != 4) {
		printf("Usage: %s adresse_service port_serveur volume\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	volume = atoi(argv[3]);
	if (volume == 0 || volume > BUFSIZE) {
		fprintf(stderr, "Donnez un volume inferieur a %d octets\n", BUFSIZE);
		exit(EXIT_FAILURE);
	}

	/* Initialisation du buffer */
	memset(buf, 'a', volume);

	/*
	 * Obtention de l'adresse IP du distant, a partir de son nom par
	 * consultation du fichier /etc/hosts ou de la base hosts des NIS
	 * ou du DNS (Domain Name Service)
	 * cf. man getaddrinfo(3)
	 */
	memset(&hints, 0, sizeof(struct addrinfo));
	hints.ai_family = AF_UNSPEC;          /* IPv4 ou IPv6 */
	hints.ai_socktype = SOCK_DGRAM;       /* Datagram socket */
	hints.ai_flags = 0;
	hints.ai_protocol = 0;                /* Any protocol */

	s = getaddrinfo(argv[1], argv[2], &hints, &result);
	if (s != 0) {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
		exit(EXIT_FAILURE);
	}

	/* getaddrinfo() retourne une liste de structures d'adresses.
	   On essaie chaque adresse jusqu'a ce que socket(2) reussisse. */
	for (rp = result; rp != NULL; rp = rp->ai_next) {
		/* Ouverture de la socket */
		sfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
		if (sfd >= 0)
			break;
	}
	if (rp == NULL) {     /* Aucune adresse valide */
		fprintf(stderr, "Impossible d'ouvrir une socket vers %s\n", argv[1]);
		perror("socket");
		exit(EXIT_FAILURE);
	}

	freeaddrinfo(result); /* Plus besoin */

	/* Permettons le broadcast (IPv4 only) */
	val = 1;
	if (setsockopt(sfd, SOL_SOCKET, SO_BROADCAST, &val, sizeof(val)) < 0) {
		perror("setsockopt broadcast");
		exit(EXIT_FAILURE);
	}

	/*localInterface.s_addr = inet_addr("224.0.0.1");
	if(setsockopt(sfd, IPPROTO_IP, IP_MULTICAST_IF, (char *)&localInterface, sizeof(localInterface)) < 0)
	{
		perror("Setting local interface error");
		exit(1);
	} else{
		printf("Setting the local interface...OK\n");
	}*/

	memset((char *) &groupSock, 0, sizeof(groupSock));

	groupSock.sin_family = AF_INET;

	groupSock.sin_addr.s_addr = inet_addr(argv[1]);

	groupSock.sin_port = htons(atoi(argv[2]));

 
	/* Envoi donnees */
	nsend = sendto(sfd, buf, volume, 0, (struct sockaddr*)&groupSock, sizeof(groupSock));
	if (nsend < 0)
		perror("sendto");

	exit(EXIT_SUCCESS);
}
