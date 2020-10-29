function Attacktype_Detection(){
	
	if (key_right_attack) {
		if (is_facingRight) {
			attacktype = "F";
		}
		else {
			attacktype = "B";
		}
		
	}
	
	if (key_left_attack) {
		if (is_facingRight) {
			attacktype = "B";
		}
		else {
			attacktype = "F";
		}
		
	}
	
	if (key_up_attack) {
		attacktype = "U";	
	}
	
	if (key_down_attack) {
		attacktype = "D";
	}
	
	if (key_special) {
		if (string_length(attacktype) < 2) {
			attacktype += "B";
		}
	}
	
	return attacktype;
	
}
