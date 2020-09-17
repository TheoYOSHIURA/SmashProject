if (is_floating) {
	anchorY += (obj_player1.y - 10 - anchorY) / 25;
	y = anchorY + sin(timer*frequency)*amplitude;
	timer++;
	
	if (obj_player1.is_facingRight) {
		xTo = obj_player1.x - 30;
	}
	else {
		xTo = obj_player1.x + 30;
	}
	
	x += (xTo - x) / 25;
}

if (is_thrown) {
	gravity_force_var += gravitiy_acceleration;
	y += gravity_force_var;
	if (place_meeting(x, y + gravity_force_var, obj_ground1)) {
		while (!place_meeting(x, y - 3, obj_ground1)) {
			y += 0.1;
		}
		gravity_force_var = 0;
		is_thrown = false;
		is_pinned = true;
	}
}
