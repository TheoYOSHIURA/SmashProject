//Gamepad Connection-------------------------------------------------------------//
if (gamepad_is_connected(1)) {
	is_gamepadConnected = true;
} else {
	is_gamepadConnected = false;
}

//Controls-------------------------------------------------------------//

key_right_attack = keyboard_check_pressed(vk_right);
key_left_attack = keyboard_check_pressed(vk_left);
key_down_attack = keyboard_check_pressed(vk_down);
key_up_attack = keyboard_check_pressed(vk_up);

key_right_movement = keyboard_check(ord("D"));
key_left_movement = keyboard_check(ord("A"));
key_down_movement = keyboard_check(ord("S"));
key_up_movement = keyboard_check(ord("W"));

key_jump = keyboard_check_pressed(vk_space);
key_dodge = keyboard_check_pressed(vk_left);


//States-------------------------------------------------------------//

//is_onGround-------------------------------------------------------------//
if (place_meeting(x, y + 1, obj_ground1)) {
	is_onGround = true;
} else {
	is_onGround = false;
}

//is_facingRight-------------------------------------------------------------//
if (is_onGround) {
	facing = key_right_movement - key_left_movement;
	if (facing > 0) {
		image_xscale = 1;
		is_facingRight = true;
	}
	if (facing < 0) {
		image_xscale = -1;
		is_facingRight = false;
	}
}

	
//Movements-------------------------------------------------------------//

//Horizontal Movements-------------------------------------------------------------//
if (key_right_movement) and (horizontal_speed < horizontal_speed_max){
	horizontal_speed += horizontal_speed_acceleration;

}

if (key_left_movement) and (horizontal_speed > -horizontal_speed_max){
	horizontal_speed -=horizontal_speed_acceleration;

}

if (place_meeting(x + horizontal_speed, y, obj_ground1)) {
	while (!place_meeting(x + sign(horizontal_speed)*0.1, y, obj_ground1)) {
		x += sign(horizontal_speed)*0.1;
	}
	horizontal_speed = 0;
}

x += horizontal_speed;

if (horizontal_speed > 0) {
	horizontal_speed -= horizontal_speed_deceleration;
}
if (horizontal_speed < 0) {
	horizontal_speed += horizontal_speed_deceleration;
}

//Vertical Movements-------------------------------------------------------------//

if (!is_onGround) {
	gravity_force_var += gravitiy_acceleration;
	number_of_jumps_var = number_of_jumps;
} else {
	gravity_force_var = gravity_force;
}

vertical_speed_var += gravity_force_var;

if (place_meeting(x, y + vertical_speed_var, obj_ground1)) {
	while (!place_meeting(x, y + sign(vertical_speed_var)*0.1, obj_ground1)) {
		y += sign(vertical_speed_var)*0.1;
	}
	vertical_speed_var = 0;
}

if (key_jump) and (number_of_jumps_var > 0) {
	vertical_speed_var = -jump_height;
	gravity_force_var = gravity_force;
	number_of_jumps_var--;
}

y += vertical_speed_var;

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

//TEST