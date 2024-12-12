#pragma once
#include <SDL.h>
#include <stdio.h>

typedef struct {
	struct {
		SDL_Window* window;
		SDL_Renderer* render;
		int width;
		int height;
	} gui;
	SDL_Event sdl_e;
	char should_quit;
} dkts_app;

dkts_app* CreateDKTS();
void DestroyDKTS(dkts_app** d_);
