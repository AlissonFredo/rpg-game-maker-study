// iniciando o primeiro estado (parado)
estado_idle = new estado();

// iniciando o estado walk (andar)
estado_walk = new estado();

estado_attack = new estado();

// estado idle precisa de um inicia
estado_idle.inicia = function() {
	// definindo a sprite atual com base na direcao que o player esta olhando	
	// ajustando a sprite
	sprite_index = define_sprite(direcao, spr_player_idle_side, spr_player_idle_back, spr_player_idle_front);
	
	// garantindo que a animacao comeca do primeiro frame
	image_index = 0;
}

estado_idle.roda = function() {
	// achar a condicao para sair desse estado
	
	// se estiver em movimento, entao vou para o estado de walk
	if(up xor down or left xor right) {
		troca_estado(estado_walk);
	}
	
	if(attack) {
		troca_estado(estado_attack);
	}
}

estado_walk.inicia = function() {
	// ajustando a sprite
	sprite_index = define_sprite(direcao, spr_player_walk_side, spr_player_walk_back, spr_player_walk_front);
	image_index = 0;
}

estado_walk.roda = function() {
	direcao = (point_direction(0, 0, velocidade_horizontal, velocidade_vertical) div 90);
	
	if(velocidade_horizontal != 0) {
		image_xscale = sign(velocidade_horizontal);
	}
	
	sprite_index = define_sprite(direcao, spr_player_walk_side, spr_player_walk_back, spr_player_walk_front);
	
	// aplicando os inputs a velocidade
	// o resultado da conta vai ser 0, -1 ou 1
	velocidade_vertical = (down - up) * velocidade_player;

	// fazendo a velocidade horizontal
	velocidade_horizontal = (right - left) * velocidade_player;
	
	// se player estiver parado trocar para o estado idle (parado)
	if(velocidade_vertical == 0 and velocidade_horizontal == 0) {
		troca_estado(estado_idle);
	}
	
	if(attack) {
		troca_estado(estado_attack);
	}
}

estado_attack.inicia = function() {
	sprite_index = define_sprite(direcao, spr_player_attack_side, spr_player_attack_back, spr_player_attack_front);
	image_index = 0;
	velocidade_horizontal = 0;
	velocidade_vertical = 0;
}

estado_attack.roda = function() {
	
	show_debug_message(image_index);
	show_debug_message(image_number);
	
	
	// saindo do ataque quando ele acabar
	if(image_index >= image_number - 0.2) {
		troca_estado(estado_idle);
	}
}

// iniciar variaveis

// controles
up = noone;
down = noone;
left = noone;
right = noone;
attack = noone;

// variaveis de movimento
velocidade_horizontal = 0;
velocidade_vertical = 0;

velocidade_player = 2;

// controlando a direcao que o player esta olhando
direcao = 3;

// iniciando maquina de estados
inicia_estado(estado_idle);