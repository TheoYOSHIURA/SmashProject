
//HUD-------------------------------------------------------------//



//Debugging HUD-------------------------------------------------------------//
draw_text_color(x, y - 20, "attacktype = " + string(attacktype), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 40, "is_onGround = " + string(is_onGround), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 60, "is_attacking = " + string(is_attacking), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 80, "is_stunned = " + string(is_stunned), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 100, "is_facingRight = " + string(is_facingRight), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 120, "is_dodging = " + string(is_dodging), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 140, "is_invincible = " + string(is_invincible), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 160, "is_gamepadConnected = " + string(is_gamepadConnected), c_black, c_black, c_black, c_black, 1);
draw_text_color(x, y - 180, "number_of_jumps = " + string(number_of_jumps), c_black, c_black, c_black, c_black, 1);