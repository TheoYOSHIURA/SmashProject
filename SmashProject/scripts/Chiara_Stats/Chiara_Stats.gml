function Chiara_Stats(){
	//Gamepad Variables-------------------------------------------------------------//
	is_gamepadConnected = false; //Ne pas toucher
	player_number = 0; //Ne pas toucher

	//Character States-------------------------------------------------------------//
	is_attacking = false; //Ne pas toucher
	is_stunned = false; //Ne pas toucher
	is_onGround = true; //Ne pas toucher
	is_facingRight = true; //Ne pas toucher
	is_dodging = false; //Ne pas toucher
	is_invincible = false; //Ne pas toucher
	is_fastFalling = false; //Ne pas toucher

	//Movement Variables-------------------------------------------------------------//

	//Jamais de nombre avec plus de 1 chiffre après la virgule
	horizontal_speed_max_ground = 10; //Vitesse maximale au sol (defaut 10)
	horizontal_speed_acceleration_ground = 1; //Acceleration au sol (defaut 1)
	horizontal_speed_deceleration_ground = 0.5; //Deceleration au sol (defaut 0.5)
	horizontal_speed_max_air = 10; //Vitesse maximale en l'air (defaut 10)
	horizontal_speed_acceleration_air = 1; //Acceleration en l'air (defaut 2)
	horizontal_speed_deceleration_air = 0.2; //Deceleration en l'air (defaut 0.5)

	gravitiy_acceleration = 0.5; //Incrementation de la gravité (toutes les 10 frames)(defaut 0.5)

	vertical_speed_max = 15; //Vitesse de chute maximale (defaut 15)
	fastFall_speed = 20; //Vitesse de chute rapide(defaut 20)
	jump_speed = 10; //Vitesse initiale de saut (defaut 10)
	number_of_jumps = 1; //Nombre de sauts en l'air (defaut 1)


	fastFall_timing = 5; //Ne pas toucher
	vertical_speed = 0; //Ne pas toucher
	gravity_force = 0; //Ne pas toucher
	horizontal_speed = 0; //Ne pas toucher
	gravity_force_var = gravity_force; //Ne pas toucher
	number_of_jumps_var = number_of_jumps; //Ne pas toucher

	//Passif-------------------------------------------------------------//

	//Attack Variables-------------------------------------------------------------//
	attacktype = "none"; //Ne pas toucher

	//Stocks-------------------------------------------------------------//
	stocks = 3;
}