#shader vertex
#version 330 core

layout(location = 0) in vec4 position;

void main()
{
    gl_Position = position;
};

#shader fragment
#version 330 core

layout(location = 0) out vec4 fragColor;

in vec4 gl_FragCoord;

uniform vec2 u_resolution;
uniform float u_time;
uniform float u_trans;

#define NUM_LAYERS 8.0

mat2 Rot(float a){
    float s = sin(a), c = cos(a);
    return mat2(c, -s, s, c);
}

float Star(vec2 uv, float flare){
    float d = length(uv);
    float m = 0.05/d;
    float rays = max(0, 1.0 - abs(uv.x * uv.y * 1000.0));
    m += rays * flare;
    uv *= Rot(3.1415/4.0);
    rays = max(0, 1.0 - abs(uv.x * uv.y * 1000.0));
    m += rays * 0.3 * flare;
    m *= smoothstep(1.0, 0.2, d);
	
    return m;
}

float Hash21(vec2 p){
    p = fract(p*vec2(123.34,456.21));
    p += dot(p, p+45.32);
    return fract(p.x*p.y);
}

vec3 StarLayer(vec2 uv){
    vec3 col = vec3(0);
    
    vec2 gv = fract(uv) - 0.5;
    vec2 id = floor(uv);

    for(int y=-1;y<=1;y++){
	for(int x=-1;x<=1;x++){
	    vec2 offs = vec2(x, y);
	    
	    float n = Hash21(id+offs);
	    float size = fract(n*345.32);
	    
	    float star = Star(gv-offs-vec2(n-0.5, fract(n*34.0)-0.5), smoothstep(0.9, 1.0, size)*0.6);

	    vec3 color = 0.5*sin(vec3(0.2, 0.3, 0.9)*fract(n*2345.2)*123.2) + 0.5;
	    color = color*vec3(1,0.25,1.0+size);

	    star *= 0.5*sin(u_time*3.0 + n*6.2831) + 1.0;
	    col += star*size*color;
	}
    }

    return col;
}

void main()
{
    vec2 uv = (gl_FragCoord.xy - 0.5*u_resolution)/u_resolution.y;
    float t = u_time*0.05;

    uv *= Rot(t);
    vec3 col = vec3(0.0);

    for(float i=0; i<1; i+=1.0/NUM_LAYERS){
	float depth = fract(i+t);
	float scale = mix(20.0, 0.5, depth);
	float fade = depth*smoothstep(1.0, 0.9, depth);
	col += StarLayer(uv*scale+i*453.2)*fade;
    }

    /*if(gv.x > 0.48 || gv.y > 0.48){
	col.r = 1.0;
    }*/
    
    fragColor = vec4(col, max(0.0,u_trans));
}

