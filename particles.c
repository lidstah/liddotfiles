#include <stdio.h>
#include <stdlib.h>
#include <SDL/SDL.h>
#include <GL/gl.h>
#include <GL/glu.h>

//proto
void DrawStuff();
void Cube();

// variables statiques
double angle = 0;
int color = 0;
int drawMode = 0;
int rotateY = 0;
int rotateX = 0;
int rotateZ = 0;

int main(int argc, const char *argv[])
{
	SDL_Init(SDL_INIT_VIDEO); // Init SDL
	SDL_WM_SetCaption("OpenGL Test", NULL);
	SDL_SetVideoMode(800, 600, 32, SDL_OPENGL);

	int colorFlag = 0; // Flag
	int angle_multiplier = 1; // valeur de départ vitesse angulaire
	int continuer = 1; // Flag

	Uint32 last_time = SDL_GetTicks(); //timers
	Uint32 current_time, elapsed_time;
	Uint32 start_time;
	SDL_Event event; //évènements (clavier, souris…)

	glMatrixMode( GL_PROJECTION ); //init GL
	glLoadIdentity();
	gluPerspective(45, (double)800/600,1,1000); // crade mais simple
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_TEXTURE_2D);
	
	DrawStuff(); // cube

	for (;;) {
		start_time = SDL_GetTicks(); // timer
		if (color < 255 && colorFlag != 1) {
			color++;
			if (color == 254 && colorFlag != 1) {
				colorFlag = 1;
			}
		}
		else if (color > 1 && colorFlag == 1) {
			color--;
			if (color == 2 && colorFlag == 1) {
				colorFlag = 0;
			}
		}
		while (SDL_PollEvent(&event))
		{
			switch (event.type)
			{
				case SDL_QUIT: // fermeture de la fenêtre
					exit(0);
					break;
				case SDL_KEYDOWN:
					switch(event.key.keysym.sym)
					{
						case SDLK_ESCAPE: // esc == quitte
							exit(0);
							break;
						case SDLK_RETURN:
							drawMode++;
							if (drawMode > 2) {
								drawMode = 0;
							}
							break;
						case SDLK_TAB:
							rotateY++;
							if (rotateY > 1) {
								rotateY = 0;
							}
							break;
						case SDLK_BACKSPACE:
							rotateX++;
							if (rotateX > 1) {
								rotateX = 0;
							}
							break;
						case SDLK_SPACE:
							rotateZ++;
							if (rotateZ > 1) {
								rotateZ = 0;
							}
							break;
						case SDLK_a:
							angle_multiplier++;
							break;
						case SDLK_z:
							angle_multiplier--;
							if (angle_multiplier == 0) {
								angle_multiplier = 1;
							}
							break;
						default:
							break;
					}
			}
		}
		current_time = SDL_GetTicks(); // timers
		elapsed_time = current_time - last_time;
		last_time = current_time;

		angle += 0.05 * elapsed_time * angle_multiplier; // valeur de rotation / frame

		DrawStuff();	
		elapsed_time = SDL_GetTicks() - start_time;
		if (elapsed_time < 15) {
			SDL_Delay(15 - elapsed_time);
		}
	}

	return EXIT_SUCCESS;
}

void DrawStuff()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // couleurs et Z-buffer

	glMatrixMode( GL_MODELVIEW ); // init GL Matrix
	glLoadIdentity();
	gluLookAt(3,4,2,0,0,0,0,0,1);
	switch(rotateZ)
	{
		case 0:
			glRotated(0,0,0,1);
			break;
		case 1:
			glRotated(angle,0,0,1);
			break;
		default:
			break;
	}
	switch(rotateX)
	{
		case 0:
			glRotated(0,1,0,0);
			break;
		case 1:
			glRotated(angle,1,0,0);
			break;
	}
	switch(rotateY)
	{
		case 0:
			glRotated(0,0,1,0);
			break;
		case 1:
			glRotated(angle,0,1,0);
			break;
	}

	switch(drawMode)
	{
		case 0:
			glBegin(GL_QUADS);
			break;
		case 1: 
			glBegin(GL_LINE_STRIP);
			break;
		case 2:
			glBegin(GL_POINTS);
			break;
		default:
			glBegin(GL_LINE_STRIP);
			break;
	}
	//glBegin(GL_LINE_STRIP);
	Cube();

	glEnd();
	glFlush();
	SDL_GL_SwapBuffers();
}

void Cube()
{

	//putain de cube ><
	
	glColor3ub(color,0,0);
	glVertex3d(1,1,1);
	glColor3ub(48,color,48);
	glVertex3d(1,1,-1);
	glColor3ub(224,160,color);
	glVertex3d(-1,1,-1);
	glColor3ub(160,160,160);
	glVertex3d(-1,1,1);

	glColor3ub(color,0,0);
	glVertex3d(1,1,1);
	glColor3ub(48,48,color);
	glVertex3d(1,1,-1);
	glColor3ub(224,color,128);
	glVertex3d(1,-1,-1);
	glColor3ub(160,160,160);
	glVertex3d(1,-1,1);

	glColor3ub(color,0,0);
	glVertex3d(1,1,1);
	glColor3ub(color,color,color);
	glVertex3d(1,-1,1);
	glColor3ub(color,160,128);
	glVertex3d(-1,-1,1);
	glColor3ub(160,color,160);
	glVertex3d(-1,1,1);

	glColor3ub(color,0,0);
	glVertex3d(-1,1,1);
	glColor3ub(48,48,color);
	glVertex3d(-1,1,-1);
	glColor3ub(224,160,128);
	glVertex3d(-1,-1,-1);
	glColor3ub(160,color,160);
	glVertex3d(-1,-1,1);

	glColor3ub(color,color,color);
	glVertex3d(-1,-1,1);
	glColor3ub(48,48,48);
	glVertex3d(1,-1,1);
	glColor3ub(color,160,128);
	glVertex3d(1,-1,-1);
	glColor3ub(160,color,160);
	glVertex3d(-1,-1,-1);

	glColor3ub(color,0,0);
	glVertex3d(-1,-1,-1);
	glColor3ub(48,48,color);
	glVertex3d(-1,1,-1);
	glColor3ub(224,color,128);
	glVertex3d(1,1,-1);
	glColor3ub(color,160,160);
	glVertex3d(1,-1,-1);
}
