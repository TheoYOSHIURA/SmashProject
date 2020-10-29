function Chiara_Attack_Execution(attacktypeE){
	
	if (is_onGround) {
		
		//Grounded Moves-------------------------------------------------------------//
		switch (attacktypeE) {
		case "F" :
			//
			break;
		case "B" :
			//
			break;
		case "D" :
			//
			break;
		case "U" :
			//
			break;
		}
		
	}
	else {
		
		//Aerial Moves-------------------------------------------------------------//
		switch (attacktypeE) {

		case "F" :
			//
			break;
		case "B" :
			//
			break;
		case "D" :
			//
			break;
		case "U" :
			//
			break;
		default :
			break;
		}
		
	}

		//Special Moves-------------------------------------------------------------//
	switch (attacktypeE) {
		
	case "FB" :
		//
		break;
	case "BB" :
		//
		break;
	case "DB" :
		if (obj_ChiaraSword.is_thrown) {
			obj_ChiaraSword.is_thrown = false;
			x = obj_ChiaraSword.x;
			y = obj_ChiaraSword.y - 6;
		}
		else {
			obj_ChiaraSword.is_thrown = true;
		}
		break;
	case "UB" :
		//
		break;
	default:
		break;
			
	}
	attacktype = "none";

}