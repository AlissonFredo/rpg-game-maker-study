// Ajustando a profundidade
depth = -bbox_bottom

if(transparente) {
	// Ficando transparente quando o player passar por tras dos objetos
	// Checar se o player existe
	if(instance_exists(obj_player)) {
		// Checar se o player esta mais alto que o objeto
		if(obj_player.y < y) {
			// Checar se o player esta atras do objeto
			if(point_in_rectangle(obj_player.x, obj_player.y, bbox_left - 10, bbox_top - 25, bbox_right + 10, bbox_top)) {
				// Ficando transparente
				image_alpha = lerp(image_alpha, 0.4, 0.03)
			} else {
				image_alpha =  lerp(image_alpha, 1, 0.1)
			}
		}
	}
}
