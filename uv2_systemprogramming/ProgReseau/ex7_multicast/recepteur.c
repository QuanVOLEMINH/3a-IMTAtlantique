#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>

#define BUFSIZE 100000

int main(int argc, char **argv) {
	int sfd, s, rsz, r, reuse;
	struct addrinfo hints;
	struct addrinfo *result, *rp;
	ssize_t nrecv;
	char buf[BUFSIZE];
	struct sockaddr_storage from;
	socklen_t fromlen;
	char host[NI_MAXHOST], service[NI_MAXSERV];
	struct ip_mreqn group;


	if (argc != 3) {
		printf("Usage: %s port\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	/* Construction de l'adresse locale (pour bind) */
	memset(&hints, 0, sizeof(struct addrinfo));
	hints.ai_family = AF_INET6;           /* Force IPv6 AF_INET6 */
	hints.ai_socktype = SOCK_DGRAM;       /* Datagram socket */
	hints.ai_flags = AI_PASSIVE;          /* Pour l'adresse IP joker */
	hints.ai_flags |= AI_V4MAPPED|AI_ALL; /* IPv4 remappe en IPv6 AI_V4MAPPED|AI_ALL*/
	hints.ai_protocol = 0;                /* Any protocol */

	s = getaddrinfo(NULL, argv[2], &hints, &result);
	if (s != 0) {
		fprintf(stderr, "getaddrinfo: %s\n", gai_strerror(s));
		exit(EXIT_FAILURE);
	}

	/* getaddrinfo() retourne une liste de structures d'adresses.
	   On essaie chaque adresse jusqu'a ce que bind(2) reussisse.
	   Si socket(2) (ou bind(2)) echoue, on (ferme la socket et on)
	   essaie l'adresse suivante. cf man getaddrinfo(3) */
	for (rp = result; rp != NULL; rp = rp->ai_next) {

		/* Creation de la socket */
		sfd = socket(rp->ai_family, rp->ai_socktype, rp->ai_protocol);
		if (sfd == -1)
			continue;

		reuse= 1;

	if(setsockopt(sfd, SOL_SOCKET, SO_REUSEPORT, (char *)&reuse, sizeof(reuse)) < 0)

	{
		perror("Setting SO_REUSEPORT error");
		exit(1);
	}

	else{
		printf("Setting SO_REUSEPORT...OK.\n");
	}
		/* Association d'un port a la socket */
		r = bind(sfd, rp->ai_addr, rp->ai_addrlen);
		if (r == 0)
			break;            /* Succes */
		close(sfd);
	}

	if (rp == NULL) {     /* Aucune adresse valide */
		perror("bind");
		exit(EXIT_FAILURE);
	}
	freeaddrinfo(result); /* Plus besoin */

	/* Force la taille du buffer de reception de la socket */
	rsz = 80000; /*modified from 800000*/
	if ( setsockopt(sfd, SOL_SOCKET, SO_RCVBUF, &rsz, sizeof(rsz)) == 0 )
		printf("SO_RCVBUF apres forcage: %d octets\n", rsz);
	else
		perror("setsockopt SO_RCVBUF");

	
	group.imr_multiaddr.s_addr = inet_addr(argv[1]); /*multicast group addr*/
	group.imr_address.s_addr = INADDR_ANY;
	group.imr_ifindex = 0;

	if(setsockopt(sfd, IPPROTO_IP, IP_ADD_MEMBERSHIP, (char *)&group, sizeof(group))<0){
		perror("add member error");
		exit(EXIT_FAILURE);
	} else {
		printf("Adding multicast group...OK.\n");
	}

	/* Boucle de communication */
	for (;;) {
		/* Reception donnees */
		fromlen = sizeof(from);
		nrecv = recvfrom(sfd, buf, BUFSIZE, 0, (struct sockaddr *)&from, &fromlen);
		if (nrecv == -1) {
			perror("Erreur en lecture socket\n");
			exit(EXIT_FAILURE);
		}
		printf("Recu %zd octets\n", nrecv);

		/* Reconnaissance de la machine cliente */
		s = getnameinfo((struct sockaddr *)&from, fromlen,
				host, NI_MAXHOST, service, NI_MAXSERV,
				NI_NUMERICHOST | NI_NUMERICSERV);
		if (s == 0)
			printf("Emetteur '%s'  Port '%s'\n", host, service);
		else
			printf("Erreur: %s\n", gai_strerror(s));
	}
}
