//instance_create_layer(x - 16, y, "Instances", obj_sword1);

//Gamepad Variables-------------------------------------------------------------//
is_gamepadConnected = false;
player_number = 0;

//Character States-------------------------------------------------------------//
is_attacking = false;
is_stunned = false;
is_onGround = true;
is_facingRight = true;
is_dodging = false;
is_invincible = false;

//Movement Variables-------------------------------------------------------------//
//Jamais de nombre avec plus de 1 chiffre après la virgule
horizontal_speed = 0;
horizontal_speed_max = 10;
horizontal_speed_acceleration = 2;
horizontal_speed_deceleration= 0.5;

gravity_force = 0;
gravitiy_acceleration = 0.05;
vertical_speed = 0;
vertical_speed_max = 20;  //montant
vertical_speed_min = -20;	//descendant
jump_height = 10;
number_of_jumps = 1;
fastFall_timing = 5;

gravity_force_var = gravity_force;
number_of_jumps_var = number_of_jumps;

//Attack Variables-------------------------------------------------------------//
attacktype = "none";