#include <glad.h>
#include <GLFW/glfw3.h>

#include <string>
#include <iostream>

#include "Renderer.h"
#include "Texture.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
//#include "VertexBuffer.h"
//#include "IndexBuffer.h"
//#include "VertexArray.h" //Tiene VertexBuffer tambien
//#include "Shader.h"


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
    window = glfwCreateWindow(960, 540, "Hello World", NULL, NULL);
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

    float positions[] = {
	100.0f, 100.0f, 0.0f, 0.0f, // 0
	200.0f, 100.0f, 1.0f, 0.0f, // 1
	200.0f, 200.0f, 1.0f, 1.0f, // 2
	100.0f, 200.0f, 0.0f, 1.0f, // 3
    };

    unsigned int indices[] = {
	0, 1, 2,
	2, 3, 0
    };

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    unsigned int vao;
    glGenVertexArrays(1, &vao);
    glBindVertexArray(vao);
    
    VertexArray va;
    VertexBuffer vb(positions, 4*4*sizeof(float));

    VertexBufferLayout layout;
    layout.Push(GL_FLOAT, 2);
    layout.Push(GL_FLOAT, 2);
    va.AddBuffer(vb, layout);
    
    IndexBuffer ib(indices, 6);

    glm::mat4 proj = glm::ortho(0.0f, 960.0f, 0.0f, 540.0f, -1.0f, 1.0f);
    glm::mat4 view(1.0f);
    view = glm::translate(view, glm::vec3(-100,0,0));
    glm::mat4 model = glm::translate(glm::mat4(1.0f), glm::vec3(200,200,0));

    glm::mat4 mvp = proj * view * model;
    
    Shader shader("res/shaders/Basic.shader");
    shader.Bind();
    shader.SetUniform4f("u_color", 0.8f, 0.3f, 0.8f, 1.0f);
    shader.SetUniformMat4f("u_MVP", mvp);
    
    Texture texture("res/textures/pikachu.png");
    texture.Bind();
    shader.SetUniform1i("u_Texture", 0);

    va.Unbind();
    vb.Unbind();
    ib.Unbind();
    shader.Unbind();

    Renderer renderer;

    float r = 0.0f;
    float increment = 0.05f;
    
    /* Loop until the user closes the window */
    while(!glfwWindowShouldClose(window)){
	/* Render here */
	renderer.Clear();
	
	shader.Bind();
	shader.SetUniform4f("u_color", r, 0.3f, 0.8f, 1.0f);
	
        renderer.Draw(va, ib, shader);

	if(r > 1.0f){
	    increment = -0.05f;
	}else if(r < 0.0f){
	    increment = 0.05f;
	}

	r += increment;
	
	/* Swap front and back buffers */
	glfwSwapBuffers(window);

	/* Poll for and process events */
	glfwPollEvents();
    }

    glfwTerminate();
    return 0;
}
