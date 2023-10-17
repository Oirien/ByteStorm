shader_type canvas_item;

uniform bool active = false;
uniform vec4 tint : source_color = vec4(1, 1, 1, 0.1);

void fragment() {
	vec4 tint_copy = tint;
	vec4 previous_color = texture(TEXTURE, UV);
	
	if (active == true)
	{
		tint_copy.r = previous_color.r;
		tint_copy.g = previous_color.g;
		tint_copy.b = previous_color.b;
		COLOR = tint_copy;
	}
}