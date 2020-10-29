function Draw_States(object){
	
	if (instance_exists(object)){
		//Debugging HUD-------------------------------------------------------------//
		draw_text_color(0, 0 + 20, "attacktype = " + string(object.attacktype), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 40, "is_onGround = " + string(object.is_onGround), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 60, "is_attacking = " + string(object.is_attacking), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 80, "is_stunned = " + string(object.is_stunned), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 100, "is_facingRight = " + string(object.is_facingRight), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 120, "is_dodging = " + string(object.is_dodging), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 140, "is_invincible = " + string(object.is_invincible), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 160, "is_gamepadConnected = " + string(object.is_gamepadConnected), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 180, "number_of_jumps = " + string(object.number_of_jumps_var), c_black, c_black, c_black, c_black, 1);
		draw_text_color(0, 0 + 200, "number_of_stocks = " + string(object.stocks), c_black, c_black, c_black, c_black, 1);
	}
	
}