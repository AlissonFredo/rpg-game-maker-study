// Ajustando profundidade do player
depth = -y;

// pegando os inputs do usuario
up = keyboard_check(vk_up) or keyboard_check(ord("W"));
down = keyboard_check(vk_down) or keyboard_check(ord("S"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
left = keyboard_check(vk_left) or keyboard_check(ord("A"));
attack = keyboard_check_pressed(vk_space) or keyboard_check_pressed(ord("J"));

// rodando maquina de estados
roda_estado();