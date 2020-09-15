camera = view_camera[0];
target = obj_player1;
original_x = camera_get_view_width(0);
original_y = camera_get_view_height(0);

camera_set_view_pos(camera, window_get_width() / 2, window_get_height());