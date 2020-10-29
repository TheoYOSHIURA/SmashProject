if (is_thrown) {
	vertical_speed += gravity_force
	if (x > room_width + 100) or (y > room_height + 100) or (x < -100) or (y < -100) {
		is_thrown = false;
	}
}
else {
	if (instance_exists(obj_Chiara)) {
		x = obj_Chiara.x;
		y = obj_Chiara.y;
	}
}

if (place_meeting(x, y + vertical_speed, obj_ground1)) {
	while (!place_meeting(x, y + sign(vertical_speed)*0.1, obj_ground1)) {
		y += sign(vertical_speed)*0.1;
	}
		vertical_speed = 0;
}

y += vertical_speed;