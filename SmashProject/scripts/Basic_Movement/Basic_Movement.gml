function Basic_Movement(){

	//Horizontal Movements
	if (is_onGround) {
		if (key_right_movement) and (horizontal_speed < horizontal_speed_max_ground){
			horizontal_speed += horizontal_speed_acceleration_ground;
		}

		if (key_left_movement) and (horizontal_speed > -horizontal_speed_max_ground){
			horizontal_speed -= horizontal_speed_acceleration_ground;
		}
	
	} else {
		if (key_right_movement) and (horizontal_speed < horizontal_speed_max_air){
			horizontal_speed += horizontal_speed_acceleration_air;
		}

		if (key_left_movement) and (horizontal_speed > -horizontal_speed_max_air){
			horizontal_speed -= horizontal_speed_acceleration_air;
		}

	}

	if (is_onGround) {
		if (horizontal_speed > 0) {
			if (horizontal_speed - horizontal_speed_deceleration_ground < 0) {
			 horizontal_speed = 0;
			} else {
				horizontal_speed -= horizontal_speed_deceleration_ground;
			}
		}
		if (horizontal_speed < 0) {
			if (horizontal_speed + horizontal_speed_deceleration_ground > 0) {
			 horizontal_speed = 0;
			} else {
				horizontal_speed += horizontal_speed_deceleration_ground;
			}
		}
	} else {
		if (horizontal_speed > 0) {
			horizontal_speed -= horizontal_speed_deceleration_air;
		}
		if (horizontal_speed < 0) {
			horizontal_speed += horizontal_speed_deceleration_air;
		}
	}

	//Horizontal Collision
	if (place_meeting(x + horizontal_speed, y, obj_ground1)) {
			while (!place_meeting(x + sign(horizontal_speed)*0.1, y, obj_ground1)) {
				x += sign(horizontal_speed)*0.1;
		}
		horizontal_speed = 0;
	}

	x += horizontal_speed;

	//Vertical Movements
	if (is_onGround) {
		gravity_force_var = gravity_force;
		number_of_jumps_var = number_of_jumps;
		is_fastFalling = true;
	} else {
		gravity_force_var += gravitiy_acceleration/10;
	}

	vertical_speed += gravity_force_var;

	//Jump and Doublejump
	if (key_jump) and (number_of_jumps_var > 0) {
		vertical_speed = -jump_speed;
		gravity_force_var = gravity_force;
		is_fastFalling = false;
		if (!is_onGround) {
			number_of_jumps_var--;
		}
	}

	if (vertical_speed >= vertical_speed_max) and (!is_fastFalling){
		vertical_speed = vertical_speed_max;
	}

	//Fast Fall
	if (vertical_speed >= -fastFall_timing) and (key_down_movement){
		is_fastFalling = true;
		vertical_speed = fastFall_speed;
	}

	//Vertical Collision
	if (place_meeting(x, y + vertical_speed, obj_ground1)) {
		while (!place_meeting(x, y + sign(vertical_speed)*0.1, obj_ground1)) {
			y += sign(vertical_speed)*0.1;
		}
		vertical_speed = 0;
	}

	y += vertical_speed;

}