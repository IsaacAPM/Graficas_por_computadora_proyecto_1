#shader vertex
#version 330 core

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 textCoord;

out vec2 v_TexCoord;

uniform mat4  u_MVP;

void main()
{
    gl_Position = u_MVP * position;
    v_TexCoord = textCoord;
};

#shader fragment
#version 330 core

layout(location = 0) out vec4 color;

in vec2 v_TexCoord;

uniform vec4 u_color;
uniform sampler2D u_Texture;

void main()
{
    vec4 textColor = texture(u_Texture, v_TexCoord);
    color = textColor;
};

