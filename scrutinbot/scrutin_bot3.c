/* this little piece of badly written software is meant to be used with the
 * ii irc client. WTFPublic Licence, lidstah, 2011-2012. Send me a beer if it's
 * usefull. Else, go fuck yourself! :)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>  // pas utilisé pour le moment, mais on pourrait en avoir besoin par la suite.
#include <unistd.h> // pour la fonction POSIX sleep(int time_in_seconds);


int main(int argc, const char *argv[])
{
	FILE* fichier_out = NULL; // speaks for itself, no? fichier visé : ~/irc/irc.leserveur.bla/\#ton_canal/out
	FILE* fichier_in = NULL; // le FIFO sur lequel on sortira les résultats : ~/irc/irc.leserveur.bla/\#ton_canal/in
	long oldPos = 0; 
	long actualPos = 0; 
	long nbBits = 0; // pour fseek depuis EOF -- est ce bien nécessaire?
	char actual_car = '0'; 
	short int areWeVoting = 0; // Flag de vote (si !#V)
	short int votePour = 0; // compteur des votes positifs (!#+)
	short int voteContre = 0; // compteur des votes négatifs (!#-)
	short int voteNeutre = 0; // compteur des votes neutres (!#0)
	short int quitProgram = 0; // une fois les résultats donnés dans la boucle principale, quitProgram vaudra 1.
	// caractères de sortie du vote: !#F (fin) on donne les résultats, et on retourne dans la boucle principale, !#Q quitte le programme (proprement)
	
	fichier_out = fopen("out","r");

	if (fichier_out == NULL) {
		printf("Erreur: le fichier out n'existe pas! ii est il installé et lancé?\n"); //débogage
		exit(0);
	}

	fseek(fichier_out, 0, SEEK_END);
	oldPos = ftell(fichier_out); // on a pas envie de relire tout le log à chaque fois
	fclose(fichier_out);

	// Boucle principale
	do {
		// on met à jour actualPos avec la fin de fichier
		fichier_out = fopen("out", "r");
		if (fichier_out == NULL) {
			printf("erreur, le fichier a disparu\n"); 
			exit(0);
		}

		fseek(fichier_out, 0, SEEK_END); // on se positionne à la fin du fichier
		actualPos = ftell(fichier_out);

		// c'est parti pour les tests, si actualPos != oldPos alors on a reçu de nouveaux messages
		// SCANNER LIGNE PAR LIGNE RECUP PSEUDO STOCKER PSEUDO SI VOTE FLAG!!!!!
		if (actualPos != oldPos) {
			nbBits = actualPos - oldPos;  //repositionnement
			fseek(fichier_out, 0 - nbBits, SEEK_END); 

			do {
				actual_car = fgetc(fichier_out); 
				if (actual_car == '!') {
					actual_car = fgetc(fichier_out); 
					if (actual_car == '#') {
						// on a bien une commande, on va pouvoir traiter!! 
						printf("commande reçue, traitement\n"); // débogage
						actual_car = fgetc(fichier_out);
						fichier_in = fopen("in","w");
						if (fichier_in == NULL) {
							printf("Erreur!!! Fichier in non disponible, sortie de programme!\n");
							fclose(fichier_in);
							fclose(fichier_out);
							exit(0);
						}
						switch(areWeVoting) {
							case 0:
								switch(actual_car) {
									case 'V':
										areWeVoting = 1;
										printf("Vote débuté");
										fprintf(fichier_in, "**** Début du vote ****\n");
										break;
									case 'Q':
										fprintf(fichier_in, "Goodbye\n");
										quitProgram = 1;
										break;
									case 'H':
										fprintf(fichier_in, "Aide de scrutin bot: !# suivit par V,H,F,Q,+,-,0 définit une commande, où V = début de vote, F = fin de vote, H = cette aide, Q = quitte le programme, + = vote pour, - = vote contre, 0 = vote neutre\n");
										break;
									default:
										printf("Commande invalide\n");
										break;
								}
								break;
							case 1:
								switch(actual_car) {
									case 'V':
										fprintf(fichier_in, "Un vote est déjà en cours!\n");
										break;
									case 'F':
										printf("fin de vote\n");
										areWeVoting = 0;
										fprintf(fichier_in, "**** Fin de Vote ****\nRésultats du vote: %d votes POUR, %d votes CONTRE, %d votes NEUTRES\n", votePour, voteContre, voteNeutre);
										if (votePour - voteContre > 0 && voteNeutre - votePour - voteContre < 0) {
											fprintf(fichier_in, "La proposition est acceptée par %d voix contre %d voix, avec %d voix neutres\n", votePour, voteContre, voteNeutre);
										}
										else if (votePour - voteContre < 0 && voteNeutre - votePour - voteContre < 0) {
											fprintf(fichier_in, "La proposition est refusée par %d voix contre %d voix, avec %d voix neutres\n", voteContre, votePour, voteNeutre);
										}
										else {
											fprintf(fichier_in, "absence de votes ou trop de votes neutres: la proposition ne peut être acceptée en l'état\n");
										}
										// Vote terminé, réinitialisation des variables.
										votePour = 0;
										voteContre = 0;
										voteNeutre = 0;
										break;
									case '+':
										votePour++;
										printf("un vote PUR\n");
										break;
									case '-':
										voteContre++;
										printf("un vote contre\n");
										break;
									case '0':
										voteNeutre++;
										printf("un vote neutre\n");
										break;
									default:
										printf("not a command\n");
										break;
								}
							default:
								printf("not a command\n");
						}
						fclose(fichier_in);
					}
					else {
						printf("fausse joie…\n");
					}
				}
			} while (actual_car != EOF); 

			oldPos = actualPos; // on remet notre oldPos à jour pour la prochaine itération
		}

		fclose(fichier_out); // on sort proprement
		sleep(3); // void sleep(secondes);

	} while (quitProgram != 1);

	printf("Goodbye!\n"); // débogage et sortie console
	return EXIT_SUCCESS;
}
