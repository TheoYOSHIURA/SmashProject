function Stocks_Gestion(){

	if (instance_exists(obj_Chiara)) {
		if (obj_Chiara.x > room_width + 100) or (obj_Chiara.y > room_height + 100) or (obj_Chiara.x < -100) or (obj_Chiara.y < -100) {
			obj_Chiara.stocks--;
			if (obj_Chiara.stocks > 0) {
				obj_Chiara.x = obj_camera.x;
				obj_Chiara.y = obj_camera.y;
			}
			else {
				instance_destroy(obj_Chiara);
			}
		}
	}
	
}