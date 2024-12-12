#include "donkatsu.h"

int main(int argc, char* args[]) {
	dkts_app* dka = CreateDKTS();

	while (dka->should_quit == 0) {
		while (SDL_PollEvent(&dka->sdl_e)) {
			if (dka->sdl_e.type == SDL_QUIT) dka->should_quit = 1;
		}
	}

	DestroyDKTS(&dka);
	SDL_Quit();
	return 0;
}
