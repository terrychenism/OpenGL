#version 150

uniform mat4 projection_matrix;
uniform mat4 model_matrix;
uniform vec3 face_normal;
uniform float step;
uniform bool pulsing;

in  vec4 vTexCoord;
in  vec4 vPosition;
in  vec4 vColor;
out vec4 interpolatedColor;
out vec2 texCoord;
out vec4 Position;


void main() 
{
  if( pulsing )
  {
	vec4 pnew = vPosition + vec4(face_normal, 0.0)*step;
	gl_Position = projection_matrix*model_matrix*pnew;
  }
  else
  {
	gl_Position = projection_matrix*model_matrix*vPosition;
	//gl_Position = projection_matrix*vPosition;
  }
  texCoord = vTexCoord.st;

  interpolatedColor = vColor;

  Position = gl_Position; 
} 
