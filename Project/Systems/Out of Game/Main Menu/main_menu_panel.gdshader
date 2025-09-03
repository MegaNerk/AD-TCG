shader_type canvas_item;
render_mode blend_mix, unshaded;

float get_surge_value(){
	return abs(sin(TIME / 5.0) * 100.0);
}

float get_intensity(vec4 input){
	float output = (input.r + input.g + input.b)/3.0;
	return output;
}

void vertex() {
	if (UV.y > 0.5){
		VERTEX.y += get_surge_value() + 50.0;
	}
	else{
		VERTEX.y -= get_surge_value() + 50.0;
	}
	
	if (UV.x > 0.5){
		VERTEX.x += get_surge_value() + 50.0;
	} else{
		VERTEX.x -= get_surge_value() + 50.0;
	}
}

void fragment() {
	vec4 cur_color = texture(TEXTURE,UV);
	
	//cur_color.a -= get_intensity(cur_color);
	
	if (get_intensity(cur_color) > 0.4) {
		cur_color.a = 0.0;
	}
	COLOR = cur_color;

	//for (float x = -1.0; x <= 1.0; x += 0.01){
		//for (float y = -1.0; y < 1.0; y += 0.01){
			//vec2 offset = vec2(x,y) * TEXTURE_PIXEL_SIZE;
			//vec4 offset_pixel = texture(TEXTURE, offset);
			//if (get_intensity(offset_pixel) < 0.3755){
				//cur_color.a = 0.0;
			//}
		//}
	//}
}
