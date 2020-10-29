function Controls_Detection(){

	if (is_gamepadConnected) {
		key_right_attack = gamepad_axis_value(player_number,gp_axisrh) > 0.5;
		key_left_attack = gamepad_axis_value(player_number,gp_axisrh) < -0.5;
		key_down_attack = gamepad_axis_value(player_number,gp_axisrv) > 0.5;
		key_up_attack = gamepad_axis_value(player_number,gp_axisrv) < -0.5;

		key_right_movement = gamepad_axis_value(player_number,gp_axislh) > 0.5;
		key_left_movement = gamepad_axis_value(player_number,gp_axislh) < -0.5;
		key_down_movement = gamepad_axis_value(player_number,gp_axislv) > 0.5;
		key_up_movement = gamepad_axis_value(player_number,gp_axislv) < -0.5;
	
		key_jump = gamepad_button_check_pressed(player_number,gp_shoulderr);
		key_dodge = gamepad_button_check_pressed(player_number,gp_face4);
		key_special = gamepad_button_check(player_number,gp_shoulderl);
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
		key_special = keyboard_check_pressed(vk_control);
	}

}