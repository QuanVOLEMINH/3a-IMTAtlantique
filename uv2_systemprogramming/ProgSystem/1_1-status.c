/*
 * Auteur(s):
 *
 * Cet programme refait ce que fait la commande "ls". Il donne des
 * informnations sur les caracteristiques de fichiers dont le nom est passe
 * en parametre.
 *
 * Utilisation de la primitive stat(2) et de la fonction getpwuid(3).
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <pwd.h>
#include <stdio.h>
#include <stdlib.h>

/* Petite fonction qui se charge d'envoyer les messages d'erreur
   et qui ensuite "suicide" le processus. */

void erreur_grave(char *msg) {
  perror(msg);
  exit(EXIT_FAILURE);
}

/* Fonction principale (fournie avec erreur(s?)) */

int main(int argc, char **argv) {
  struct stat status, *buffer;
  int r;
  // struct passwd info, ignore_info, *info_buffer, *ignore_buffer;

  // buffer = malloc(sizeof(struct stat)); -> 1e solution
  buffer = &status;
  // info_buffer = &info;
  // ignore_buffer = &ignore_info;

  r = stat(argv[1], buffer);

  if (r < 0)
    erreur_grave("Stat"); 

  // info_buffer = getpwuid(buffer->st_uid);
  // ignore_buffer = getpwuid(1000);

  printf("Fichier %s:  mode: %X  Taille: %ld  Proprietaire: %s\n",
	argv[1], status.st_mode, buffer->st_size, getpwuid(buffer->st_uid)->pw_name);

  exit(EXIT_SUCCESS);
}
