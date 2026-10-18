// pegando os inputs do usuario
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);

// aplicando os inputs a velocidade
// o resultado da conta vai ser 0, -1 ou 1
velocidade_vertical = (down - up) * velocidade_player;

velocidade_horizontal = (right - left) * velocidade_player;