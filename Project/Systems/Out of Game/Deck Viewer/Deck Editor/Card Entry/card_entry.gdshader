shader_type canvas_item;

uniform float fade_thickness : hint_range(0.0, 10.0) = 5.0; // in pixels
uniform vec2 tr_size;

void fragment() {
	//float v_multiplier = float(textureSize(TEXTURE, 0).x)/tr_size.x;
	//float v_height = float(textureSize(TEXTURE, 0).y) * v_multiplier;
	//
	//float v_center = v_height/2.0;
	//float p_coord = UV.y * v_height;

	//if((p_coord + (fade_thickness * v_multiplier)) <= v_center || (p_coord - (fade_thickness * v_multiplier)) >= v_center){
		//COLOR = vec4(1.0);
	//}
	
	//if (((0.25 * v_slice) + adj_uvy) >= 0.5 && (adj_uvy - (0.25 * v_slice)) <= 0.5){
		//COLOR = vec4(1.0);
	//}
	
	float scalar = tr_size.x/TEXTURE_PIXEL_SIZE.x;
	vec2 true_pixel_size = TEXTURE_PIXEL_SIZE * scalar;
	float v_center = true_pixel_size.y/2.0;
	
	vec2 true_coords = UV * true_pixel_size;
	
	if (true_coords.y + (fade_thickness) >= v_center){
		COLOR = vec4(1.0);
	}

}