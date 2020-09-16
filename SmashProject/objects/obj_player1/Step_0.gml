//Gamepad Connection-------------------------------------------------------------//
if (gamepad_is_connected(player_number)) {
	is_gamepadConnected = true;
} else {
	is_gamepadConnected = false;
}

//Controls-------------------------------------------------------------//
if (is_gamepadConnected) {
	key_right_attack = gamepad_axis_value(player_number,gp_axisrh) > 0.5;
	key_left_attack = gamepad_axis_value(player_number,gp_axisrh) < -0.5;
	key_down_attack = gamepad_axis_value(player_number,gp_axisrv) > 0.5;
	key_up_attack = gamepad_axis_value(player_number,gp_axisrv) < -0.5;

	key_right_movement = gamepad_axis_value(player_number,gp_axislh) > 0.5;
	key_left_movement = gamepad_axis_value(player_number,gp_axislh) < -0.5;
	key_down_movement = gamepad_axis_value(player_number,gp_axislv) > 0.5;
	key_up_movement = gamepad_axis_value(player_number,gp_axislv) > 0.5;

	key_jump = gamepad_button_check_pressed(player_number,gp_shoulderr);
	key_dodge = gamepad_button_check_pressed(player_number,gp_face4);
} else {
	key_right_attack = keyboard_check_pressed(vk_right);
	key_left_attack = keyboard_check_pressed(vk_left);
	key_down_attack = keyboard_check_pressed(vk_down);
	key_up_attack = keyboard_check_pressed(vk_up);

	key_right_movement = keyboard_check(ord("D"));
	key_left_movement = keyboard_check(ord("A"));
	key_down_movement = keyboard_check_pressed(ord("S"));
	key_up_movement = keyboard_check_pressed(ord("W"));

	key_jump = keyboard_check_pressed(vk_space) or key_up_movement;
	key_dodge = keyboard_check_pressed(vk_left);
}



//States-------------------------------------------------------------//

//is_onGround-------------------------------------------------------------//
if (place_meeting(x, y + 1, obj_ground1)) {
	is_onGround = true;
} else {
	is_onGround = false;
}

//is_facingRight-------------------------------------------------------------//
if (is_onGround) {
	if (key_right_movement) {
		image_xscale = 1;
		is_facingRight = true;
	}
	if (key_left_movement) {
		image_xscale = -1;
		is_facingRight = false;
	}
}

	
//Movements-------------------------------------------------------------//

	//Horizontal Movements-------------------------------------------------------------//
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

if (horizontal_speed > 0) {
	if (is_onGround) {
		horizontal_speed -= horizontal_speed_deceleration_ground;
	}
	else {
		horizontal_speed -= horizontal_speed_deceleration_air;
	}
}
if (horizontal_speed < 0) {
	if (is_onGround) {
		horizontal_speed += horizontal_speed_deceleration_ground;
	}
	else {
		horizontal_speed += horizontal_speed_deceleration_air;
	}
}

	//Horizontal Collision-------------------------------------------------------------//
if (place_meeting(x + horizontal_speed, y, obj_ground1)) {
		while (!place_meeting(x + sign(horizontal_speed)*0.1, y, obj_ground1)) {
			x += sign(horizontal_speed)*0.1;
	}
	horizontal_speed = 0;
}

x += horizontal_speed;

	//Vertical Movements-------------------------------------------------------------//
if (is_onGround) {
	gravity_force_var = gravity_force;
	number_of_jumps_var = number_of_jumps;
	is_fastFalling = true;
} else {
	gravity_force_var += gravitiy_acceleration;
}

vertical_speed += gravity_force_var;

		//Jump and Doublejump-------------------------------------------------------------//
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
		//Fast Fall-------------------------------------------------------------//
if (vertical_speed >= -fastFall_timing) and (key_down_movement){
	is_fastFalling = true;
	vertical_speed = fastFall_speed;
}


		//Vertical Collision-------------------------------------------------------------//
if (place_meeting(x, y + vertical_speed, obj_ground1)) {
	while (!place_meeting(x, y + sign(vertical_speed)*0.1, obj_ground1)) {
		y += sign(vertical_speed)*0.1;
	}
	vertical_speed = 0;
}

y += vertical_speed;

//Attacks-------------------------------------------------------------//
if (!is_attacking) and (!is_stunned) and (!is_dodging) {
	if (is_onGround) {
		
	//Grounded Moves-------------------------------------------------------------//
	
		//F-tilt-------------------------------------------------------------//
		if (key_right_attack) {
			is_attacking = true;
			if (is_facingRight) {
				attacktype = "F-tilt";
			}
			else {
				attacktype = "B-tilt";
			}
		}
		
		if (key_left_attack) {
			is_attacking = true;
			if (is_facingRight) {
				attacktype = "B-tilt";
			}
			else {
				attacktype = "F-tilt";
			}
		}
		
		
		//D-tilt-------------------------------------------------------------//
		if (key_down_attack) {
			is_attacking = true;
			attacktype = "D-tilt";
		}
		
		//U-tilt-------------------------------------------------------------//
		if (key_up_attack) {
			is_attacking = true;
			attacktype = "U-tilt";
		}
		
	} else {
	
	//Aerial Moves-------------------------------------------------------------//
		
		//F-air and B-air-------------------------------------------------------------//
		if (key_right_attack) {
			is_attacking = true;
			if (is_facingRight) {
				attacktype = "F-air";
			}
			else {
				attacktype = "B-air";
			}
		}
		
		if (key_left_attack) {
			is_attacking = true;
			if (is_facingRight) {
				attacktype = "B-air";
			}
			else {
				attacktype = "F-air";
			}
		}
		
		//D-air-------------------------------------------------------------//
		if (key_down_attack) {
			is_attacking = true;
			attacktype = "D-air";
		}
		
		//U-air-------------------------------------------------------------//
		if (key_up_attack) {
			is_attacking = true;
			attacktype = "U-air";
		}
	}	
}

//Attack Execution-------------------------------------------------------------//
switch (attacktype) {
	
	//Grounded Moves
	case "F-tilt" :
		//
		is_attacking = false;
		break;
	case "B-tilt" :
		//
		is_attacking = false;
		break;
	case "D-tilt" :
		//
		is_attacking = false;
		break;
	case "U-tilt" :
		//
		is_attacking = false;
		break;
	
	//Aerial Moves
	case "F-air" :
		//
		is_attacking = false;
		break;
	case "B-air" :
		//
		is_attacking = false;
		break;
	case "D-air" :
		//
		is_attacking = false;
		break;
	case "U-air" :
		//
		is_attacking = false;
		break;
	default :
		is_attacking = false;
		break;
}

//Passif-------------------------------------------------------------//



//TEST
if (keyboard_check_pressed(ord("R"))) {
	room_restart();
}
