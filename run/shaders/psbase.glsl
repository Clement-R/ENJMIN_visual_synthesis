varying vec3 normal;
varying vec4 color;

void main()
{
	float intensity;
	vec4 fColor;
	vec3 n = normalize(normal);
	intensity = dot(vec3(gl_LightSource[0].position),n);

	// Cel shadding effect
	if (intensity > 0.95)
	{
		// fColor = vec4(1.0,0.5,0.5,1.0);
		fColor = vec4(color.r, color.g / 1.5, color.b / 1.5, color.a);
		// fColor = vec4(color.r, color.g, color.b, color.a);
	}
	else if (intensity > 0.5) {
		// fColor = vec4(0.6,0.3,0.3,1.0);
		fColor = vec4(color.r / 1.2, color.g / 2.5, color.b / 2.5, color.a);
		// fColor = vec4(color.r, color.g, color.b, color.a);
	}
	else if (intensity > 0.25)
	{
		// fColor = vec4(0.4,0.2,0.2,1.0);
		fColor = vec4(color.r / 2, color.g / 2.5, color.b / 2.5, color.a);
		// fColor = vec4(color.r, color.g, color.b, color.a);
	}
	else
	{
		// fColor = vec4(0.2,0.1,0.1,1.0);
		fColor = vec4(color.r / 4.2, color.g / 8, color.b / 8, color.a);
		// fColor = vec4(color.r, color.g, color.b, color.a);
	}
	gl_FragColor = fColor;
}