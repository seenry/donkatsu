#include "donkatsu.h"


dkts_app* CreateDKTS() {
	dkts_app* d_ = (dkts_app*)malloc(sizeof(dkts_app));
	if (d_ == 0) {
		printf("Memory allocation failed.\n");
		exit(-1);
	}

	d_->gui.width = 1024;
	d_->gui.height = 768;

	if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) != 0) { printf("SDL_Init failed: %s\n", SDL_GetError()); exit(-1); }

	d_->gui.window = 0;
	d_->gui.window = SDL_CreateWindow("donkatsu", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, d_->gui.width, d_->gui.height, SDL_WINDOW_RESIZABLE);
	if (d_->gui.window == 0) { printf("SDL_CreateWindow failed: %s\n", SDL_GetError()); exit(-1); }

	d_->gui.render = 0;
	d_->gui.render = SDL_CreateRenderer(d_->gui.window, -1, 0);
	if (d_->gui.render == 0) { printf("SDL_CreateRenderer failed: %s\n", SDL_GetError()); exit(-1); }

	d_->should_quit = 0;

	return d_;
}

void DestroyDKTS(dkts_app** d_) {
	dkts_app* d = *d_;
	SDL_DestroyRenderer(d->gui.render);
	SDL_DestroyWindow(d->gui.window);

	free(d);
	*d_ = 0;
}
