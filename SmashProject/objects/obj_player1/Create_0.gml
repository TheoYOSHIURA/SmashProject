//instance_create_layer(x - 16, y, "Instances", obj_sword1);

//Gamepad Variables-------------------------------------------------------------//
is_gamepadConnected = false;

//Character States-------------------------------------------------------------//
is_attacking = false;
is_stunned = false;
is_onGround = true;
is_facingRight = true;
is_dodging = false;
is_invincible = false;

//Movement Variables-------------------------------------------------------------//
horizontal_speed = 0;
horizontal_speed_max = 10;
horizontal_speed_deceleration = 1; //Jamais de nombre avec plus de 1 chiffre après la virgule
horizontal_speed_acceleration = 2; //Jamais de nombre avec plus de 1 chiffre après la virgule

gravity_force = 1; //Gravité de base
gravitiy_acceleration = 0.1;
vertical_speed = 10;
jump_height = 20;
number_of_jumps = 1;

vertical_speed_var = vertical_speed;
gravity_force_var = gravity_force;
number_of_jumps_var = number_of_jumps;

//Attack Variables-------------------------------------------------------------//
attacktype = "none";