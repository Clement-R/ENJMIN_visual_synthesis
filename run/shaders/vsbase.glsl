varying vec3 normal;
varying vec3 vertex_to_light_vector;
varying vec4 color;

uniform float elapsed;
uniform mat4 view;
uniform mat4 invertView;

#define M_PI 3.1415926535897932384626433832795

float rand(float n){return fract(sin(n) * 43758.5453123);}

float noise(float p){
	float fl = floor(p);
	float fc = fract(p);
	return mix(rand(fl), rand(fl + 1.0), fc);
}

void main()
{
	/*
	// Transforming The Vertex
	vec4 a = gl_Vertex;
	a.x = a.x * 1;
	a.y = a.y * 1;
	gl_Position = gl_ModelViewProjectionMatrix * a;
	
	vec4 temp = invertView * gl_ModelViewMatrix * gl_Vertex;
	
	//Couleur
	color = gl_Color;	
    if(color.b > 0.5) {
		temp.z += sin(M_PI * elapsed);
	}	

	gl_Position = view * temp * gl_ProjectionMatrix;

	// Transforming The Normal To ModelView-Space
	normal = gl_NormalMatrix * gl_Normal; 

	//Direction lumiere
	vertex_to_light_vector = vec3(gl_LightSource[0].position);
	*/


	// BASE SHADER

	/*
	// Transforming The Vertex
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;

	// Transforming The Normal To ModelView-Space
	normal = gl_NormalMatrix * gl_Normal; 

	//Direction lumiere
	vertex_to_light_vector = vec3(gl_LightSource[0].position);

	//Couleur
	color = gl_Color;
	*/



	/*
	float scale = 1.0f;
	vec4 Vertex;
    Vertex = gl_Vertex;

	// Color
	color = gl_Color;

	// If it's a water voxel, we apply a wave movement on its Z component
	if(color.b > 0.9) {
		Vertex.z *= 0.1 * sin(2 * elapsed + noise(elapsed)) + 0.8;
	}
	
	// Transforming the vertex
    gl_Position = gl_ModelViewProjectionMatrix * scale * Vertex;
	
	// Light direction
	vertex_to_light_vector = vec3(gl_LightSource[0].position);
	*/

	vec4 Vertex;
	Vertex = gl_Vertex;
	normal = gl_NormalMatrix * gl_Normal;

	// Color
	color = gl_Color;

	// If it's a water voxel, we apply a wave movement on its Z component
	if(color.b > 0.8) {
		Vertex.z *= 0.1 * sin(2 * elapsed + noise(elapsed)) + 0.9;
	}
	
	// Transforming the vertex
    gl_Position = gl_ModelViewProjectionMatrix * Vertex;
}