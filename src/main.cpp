#include <glad.h>
#include <GLFW/glfw3.h>

#include <string>
#include <iostream>

/*
  La clase Renderer incluye las siguentes clases:
      - Renderer
      - Shader
      - VertexBuffer
      - VetexArray
      - IndexBuffer
 */
#include "Renderer.h" 
#include "Texture.h"

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

#include <chrono>


const float W_WIDTH = 700.0;
const float W_HEIGHT = 700.0;

float x_spiral(float t, int phi){
    return sin(t)*phi*t/3.1416;
}

float y_spiral(float t, int phi){
    return cos(t)*phi*t/3.1416;
}


int main(){
    GLFWwindow* window;

    /* Initialize the library GLFW */
    if(!glfwInit()){
	return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 6);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    /* Create a windowed mode window and its OpenGL context */
    window = glfwCreateWindow(W_WIDTH, W_HEIGHT, "Hello World", NULL, NULL);
    if(!window){
	glfwTerminate();
	return -1;
    }

    /* Make the window's context current */
    glfwMakeContextCurrent(window);

    if(!gladLoadGLLoader((GLADloadproc)glfwGetProcAddress)){
	std::cout << "Faild to initialize GLAD" << std::endl;
	return -1;
    }

    std::cout << glGetString(GL_VERSION) << std::endl;

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    unsigned int vao;
    glGenVertexArrays(1, &vao);
    glBindVertexArray(vao);

    /************************Fondo de estrellas*****************************/

    float star_positions[] = {
	-1.0f, -1.0f, // 0
	 1.0f, -1.0f, // 1
	 1.0f,  1.0f, // 2
	-1.0f,  1.0f  // 3
    };

    unsigned int indices[] = {
	0, 1, 2,
	2, 3, 0
    };
    
    VertexArray va_star;
    VertexBuffer vb_star(star_positions, 4*2*sizeof(float));

    VertexBufferLayout layout_star;
    layout_star.Push(GL_FLOAT, 2);
    va_star.AddBuffer(vb_star, layout_star);
    
    IndexBuffer ib_star(indices, 6);
    
    Shader space_shader("res/shaders/Space.shader");
    space_shader.Bind();
    space_shader.SetUniform2f("u_resolution", W_WIDTH, W_HEIGHT);
    space_shader.SetUniform1f("u_trans", 1.0f);

    Shader vortex_shader("res/shaders/Vortex.shader");
    float vortex_trans = 0.0f;
    vortex_shader.Bind();
    vortex_shader.SetUniform2f("u_resolution", W_WIDTH, W_HEIGHT);
    vortex_shader.SetUniform1f("u_trans", vortex_trans);

    va_star.Unbind();
    vb_star.Unbind();
    ib_star.Unbind();
    space_shader.Unbind();
    vortex_shader.Unbind();

    /**************************Nave espacial***********************************/
    
    float ss_positions[] = {
	-70.0f, -70.0f, 0.0f, 0.0f, // 0
	 70.0f, -70.0f, 1.0f, 0.0f, // 1
	 70.0f,  70.0f, 1.0f, 1.0f, // 2
	-70.0f,  70.0f, 0.0f, 1.0f, // 3
    };

    unsigned int ss_indices[] = {
	0, 1, 2,
	2, 3, 0
    };

    VertexArray va_ss;
    VertexBuffer vb_ss(ss_positions, 4*4*sizeof(float));

    VertexBufferLayout layout_ss;
    layout_ss.Push(GL_FLOAT, 2);
    layout_ss.Push(GL_FLOAT, 2);
    va_ss.AddBuffer(vb_ss, layout_ss);
    
    IndexBuffer ib_ss(ss_indices, 6);
    
    float t = 80.0f;
    int phi = 9;

    std::cout << x_spiral(t, 30) << ", " << y_spiral(t, 30)  << std::endl;
    
    glm::mat4 proj = glm::ortho(-300.0f, 300.0f, -300.0f, 300.0f, -100.0f, 100.0f);
    glm::mat4 view(1.0f);
    glm::mat4 transform = glm::translate(view, glm::vec3(x_spiral(t, phi), y_spiral(t, phi),0));

    glm::mat4 mvp = proj * transform;
    
    Shader basic_shader("res/shaders/Basic.shader");
    basic_shader.Bind();
    basic_shader.SetUniformMat4f("u_MVP", mvp);
    
    Texture texture("res/textures/space_ship.png");
    texture.Bind();
    basic_shader.SetUniform1i("u_Texture", 0);

    va_ss.Unbind();
    vb_ss.Unbind();
    ib_ss.Unbind();
    basic_shader.Unbind();
    
    /*************************************************************************/
    
    Renderer renderer;

    std::chrono::duration<float> duration;
    float time, elapse;

    auto start = std::chrono::high_resolution_clock::now();
    auto t1 = std::chrono::high_resolution_clock::now();
    
    /* Loop until the user closes the window */
    while(!glfwWindowShouldClose(window)){
	/* Render here */
	renderer.Clear();

        auto end = std::chrono::high_resolution_clock::now();
	duration = end - start;
	time = duration.count();

	space_shader.Bind();
	space_shader.SetUniform1f("u_time", time);
	renderer.Draw(va_star, ib_star, space_shader);

	if(t<40){
	    vortex_trans = vortex_trans + 0.001;
	    vortex_shader.Bind();
	    vortex_shader.SetUniform1f("u_time", time);
	    vortex_shader.SetUniform1f("u_trans", vortex_trans);
	    renderer.Draw(va_star, ib_star, vortex_shader);
	}
	
	duration = end - t1;
	elapse = duration.count();
	
	if(elapse>0.05 && t>0){
	    t1 = end;
	    t = t - 0.1;
	    transform = glm::translate(view, glm::vec3(x_spiral(t,phi),y_spiral(t,phi),t));
	    mvp = proj * transform;
	    basic_shader.Bind();
	    basic_shader.SetUniformMat4f("u_MVP", mvp);
	}
	
	renderer.Draw(va_ss, ib_ss, basic_shader);
	
	/* Swap front and back buffers */
	glfwSwapBuffers(window);

	/* Poll for and process events */
	glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
