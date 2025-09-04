shader_type canvas_item;

uniform vec3 border_color : source_color = vec3(0.01, 0.2, 0.01);
uniform float inner_border_perc : hint_range(0.0,1.0,0.01) = 0.65;
uniform float outer_border_perc : hint_range(0.0,1.0,0.01) = 1.0;
uniform float color_sat : hint_range(0.0,1.0,0.01) = 0.15;
uniform float max_border_strength : hint_range(0.0,1.0,0.01) = 0.9;

float get_edge_value(vec2 center_uv, float e1, float e2){
	float output = smoothstep(e1, e2, max(abs(center_uv.x),abs(center_uv.y)));
	return output;
}

void fragment() {
	vec4 cur_color = texture(TEXTURE, UV);
	vec2 centralized_uv = ((UV * 2.0) - vec2(1.0));
	float edge_value = get_edge_value(centralized_uv, inner_border_perc, outer_border_perc);
	cur_color.rgb = mix(cur_color.rgb, border_color.rgb, clamp(edge_value, color_sat, max_border_strength));
	COLOR = cur_color;
}