function States_Gestion(){

	//is_onGround
	if (place_meeting(x, y + 1, obj_ground1)) {
		is_onGround = true;
	} else {
		is_onGround = false;
	}

	//is_facingRight
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

}