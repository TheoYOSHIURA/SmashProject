function Gamepad_Detection(){

	if (gamepad_is_connected(player_number)) {
		is_gamepadConnected = true;
	} else {
		is_gamepadConnected = false;
	}

}