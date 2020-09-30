if keyboard_check_pressed(vk_f11)
{
	if window_get_fullscreen()
      {
      window_set_fullscreen(false);
      }
   else
      {
      window_set_fullscreen(true);
      }
}

/*
var average_x = 0;
var min_x = target.x;
var max_x = target.x;
with(target){
	average_x += x;
	if (x > max_x) {
		max_x = x;
	}
	if (x < min_x) {
		min_x = x;
	}
}

var average_y = 0;
var min_y = target.y;
var max_y = target.y
with(target){
	average_y += y;
	if (y > max_y) {
		max_y = y;
	}
	if (y < min_y) {
		min_y = y;
	}
}

average_x /= instance_number(target);
average_y /= instance_number(target);

average_x += (target.x - average_x) / 5;
average_y += (target.y - average_y) / 5;

i = point_distance(min_x, min_y, max_x, max_y);

actual_width_view_size = camera_get_view_width(camera);
actual_height_view_size = camera_get_view_height(camera);

to_width_view_size = clamp(480*i/100, 480, infinity);
to_height_view_size = clamp(270*i/100, 270, infinity);

new_width_view_size = lerp(actual_width_view_size, to_width_view_size, 0.25);
new_height_view_size = lerp(actual_height_view_size, to_height_view_size, 0.25);

camera_set_view_size(camera, new_width_view_size, new_height_view_size);

view_h_half = camera_get_view_height(camera) / 2;
view_w_half = camera_get_view_width(camera) / 2;

camera_set_view_pos(camera, average_x - view_w_half, average_y - view_h_half);
*/